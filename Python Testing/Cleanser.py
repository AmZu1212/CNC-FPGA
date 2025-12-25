import argparse
import sys
from pathlib import Path
from typing import Optional


MAX_COORD = 95.0  # millimeters; reaching or exceeding this aborts the run
MAX_FEED = 12000.0
MICRON_SCALE = 1000.0
MICRON_OFFSET = 10.0  # added after scaling to avoid downstream overflow


class ParseError(Exception):
    """Raised when an input line violates machine constraints."""


def parse_numeric(token: str) -> float:
    """Return the numeric part of a G-code token like X1.23."""
    try:
        return float(token[1:])
    except ValueError as exc:
        raise ParseError(f"Invalid numeric value in token '{token}'") from exc


def validate_and_update(
    gcode_line: str,
    last_x: float,
    last_y: float,
    last_z: float,
    last_f: float,
) -> Optional[tuple[str, float, float, float, float]]:
    """
    Strip comments, filter out non-G0/G1 lines, validate bounds, and fill defaults.

    Returns a tuple of the formatted line plus updated state, or None if the line
    should be skipped (empty or unsupported command).
    """
    # Remove comments (anything after ';') and surrounding whitespace
    clean = gcode_line.split(";", 1)[0].strip()
    if not clean:
        return None

    tokens = clean.split()
    g_cmd = None
    for tok in tokens:
        if tok.upper().startswith("G"):
            upper = tok.upper()
            if upper in ("G0", "G1"):
                g_cmd = upper
            else:
                return None  # Unsupported command, drop the line
            break

    if g_cmd is None:
        return None  # No motion command found

    x, y, z, f = last_x, last_y, last_z, last_f

    for tok in tokens:
        if len(tok) < 2:
            continue
        prefix = tok[0].upper()
        if prefix not in {"X", "Y", "Z", "F"}:
            continue
        value = parse_numeric(tok)

        if prefix in {"X", "Y", "Z"}:
            if value < 0:
                raise ParseError(f"Negative coordinate not supported: {tok}")
            if prefix in {"X", "Y"} and value >= MAX_COORD:
                raise ParseError(
                    f"{prefix} axis limit exceeded ({value}mm >= {MAX_COORD}mm)"
                )
        if prefix == "F":
            if value < 0:
                raise ParseError(f"Negative feed not supported: {tok}")
            if value >= MAX_FEED:
                raise ParseError(
                    f"Feed rate limit exceeded ({value} >= {MAX_FEED})"
                )

        if prefix == "X":
            x = value
        elif prefix == "Y":
            y = value
        elif prefix == "Z":
            z = value
        elif prefix == "F":
            f = value

    # Output as microns with a fixed offset, feeds converted to mm/sec
    x_out = x * MICRON_SCALE + MICRON_OFFSET
    y_out = y * MICRON_SCALE + MICRON_OFFSET
    z_out = z * MICRON_SCALE + MICRON_OFFSET
    f_out = f / 60.0

    def fmt_coord(val: float) -> str:
        # Six-digit, zero-padded integer microns with no decimal point
        return f"{int(round(val)):06d}"

    formatted = (
        f"{g_cmd} "
        f"X{fmt_coord(x_out)} "
        f"Y{fmt_coord(y_out)} "
        f"Z{fmt_coord(z_out)} "
        f"F{int(round(f_out)):06d}"
    )
    return formatted, x, y, z, f


def process_file(input_path: Path, output_path: Path) -> None:
    last_x = last_y = last_z = last_f = 0.0
    output_lines: list[str] = []

    for idx, line in enumerate(input_path.read_text().splitlines(), start=1):
        try:
            result = validate_and_update(line, last_x, last_y, last_z, last_f)
        except ParseError as exc:
            raise ParseError(f"Line {idx}: {exc}") from exc

        if result is None:
            continue

        formatted, last_x, last_y, last_z, last_f = result
        output_lines.append(formatted)

    output_path.write_text("\n".join(output_lines) + ("\n" if output_lines else ""))


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Normalize G-code into RUNG.G")
    parser.add_argument("input", type=Path, help="Path to input G-code file")
    parser.add_argument(
        "-o",
        "--output",
        type=Path,
        help="Output path (defaults to RUNG.G next to input file)",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    input_path: Path = args.input
    if not input_path.is_file():
        print(f"Input file not found: {input_path}", file=sys.stderr)
        sys.exit(1)

    output_path: Path = args.output or input_path.with_name("RUNG.G")

    try:
        process_file(input_path, output_path)
    except ParseError as exc:
        print(f"Error: {exc}", file=sys.stderr)
        sys.exit(1)

    print(f"Wrote normalized G-code to {output_path}")


if __name__ == "__main__":
    main()
