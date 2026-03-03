import sys
from pathlib import Path
import Cleanser


BASE = Path(__file__).resolve().parent
IN_DIR = BASE / "Test Inputs"
OUT_DIR = BASE / "Test Outputs"

TESTS = [
    {
        "name": "basic",
        "input": "01_basic.gcode",
        "expected": "01_basic_expected.gcode",
    },
    {
        "name": "missing_fields",
        "input": "02_missing_fields.gcode",
        "expected": "02_missing_fields_expected.gcode",
    },
    {
        "name": "ignore_e_and_noise",
        "input": "03_ignore_e_and_noise.gcode",
        "expected": "03_ignore_e_and_noise_expected.gcode",
    },
    {
        "name": "limit_error",
        "input": "04_limit_error.gcode",
        "expected_error": "X axis limit exceeded",
        "expected_error_file": "04_limit_error_expected.err",
    },
    {
        "name": "negative_coord",
        "input": "05_negative.gcode",
        "expected_error": "Negative coordinate not supported",
        "expected_error_file": "05_negative_expected.err",
    },
    {
        "name": "blank_lines",
        "input": "06_blank_lines.gcode",
        "expected": "06_blank_lines_expected.gcode",
    },
    {
        "name": "feed_limit",
        "input": "07_feed_limit.gcode",
        "expected_error": "Feed rate limit exceeded",
        "expected_error_file": "07_feed_limit_expected.err",
    },
]


def run_case(case: dict) -> tuple[bool, str]:
    inp = IN_DIR / case["input"]
    actual_out = OUT_DIR / f"{case['name']}_actual.gcode"

    if "expected" in case:
        expected_path = OUT_DIR / case["expected"]
        expected = expected_path.read_text()
        try:
            Cleanser.process_file(inp, actual_out)
        except Cleanser.ParseError as exc:
            return False, f"{case['name']}: unexpected error: {exc}"
        actual = actual_out.read_text()
        if actual != expected:
            return False, f"{case['name']}: output mismatch\nExpected:\n{expected}\nActual:\n{actual}"
        return True, f"{case['name']}: pass"

    expected_error = case["expected_error"]
    expected_error_file = OUT_DIR / case.get("expected_error_file", "")
    expected_err_text = expected_error_file.read_text().strip() if expected_error_file.exists() else expected_error

    try:
        Cleanser.process_file(inp, actual_out)
    except Cleanser.ParseError as exc:
        msg = str(exc)
        if expected_error not in msg:
            return False, f"{case['name']}: wrong error\nExpected: {expected_error}\nActual:   {msg}"
        if expected_error_file.exists() and msg != expected_err_text:
            return False, f"{case['name']}: error text mismatch\nExpected: {expected_err_text}\nActual:   {msg}"
        return True, f"{case['name']}: pass (expected error)"

    return False, f"{case['name']}: expected an error but processing succeeded"


def main() -> int:
    results = [run_case(case) for case in TESTS]
    for ok, message in results:
        print(("OK   " if ok else "FAIL ") + message)
    failed = [r for r in results if not r[0]]
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
