#!/usr/bin/env python3
"""
Compile and run a Verilog testbench with iverilog/vvp.

Usage examples:
  python run_verilog_test.py src/sqrt_root.v tb/sqrt_root_tb.v
  python run_verilog_test.py ./src/sqrt_root.v ./tb/sqrt_root_tb.v --wave
"""

from __future__ import annotations

import argparse
import shutil
import subprocess
import sys
from pathlib import Path


class ShortUsageParser(argparse.ArgumentParser):
    def error(self, message: str) -> None:
        print(self.usage)
        raise SystemExit(2)


def resolve_file(path_str: str, root: Path) -> Path:
    candidate = Path(path_str)
    if not candidate.is_absolute():
        candidate = (root / candidate).resolve()

    if candidate.suffix.lower() != ".v":
        raise FileNotFoundError(f"Expected a .v file path: {candidate}")
    if not candidate.exists():
        raise FileNotFoundError(f"File not found: {candidate}")

    return candidate


def run(cmd: list[str], cwd: Path) -> int:
    print(f"[cmd] {' '.join(cmd)}")
    completed = subprocess.run(cmd, cwd=str(cwd))
    return completed.returncode


def main() -> int:
    usage = "Usage: run_verilog_test.py <verilog_file_path.v> <testbench_file_path.v> [--wave]"
    parser = ShortUsageParser(
        description="Compile and run a Verilog testbench using iverilog + vvp.",
        add_help=False,
        usage=usage,
    )
    parser.add_argument("verilog_file", help="Verilog source file path (must include .v)")
    parser.add_argument("testbench_file", help="Testbench file path (must include .v)")
    parser.add_argument(
        "--wave",
        action="store_true",
        help="Open GTKWave after simulation.",
    )
    if len(sys.argv) == 1:
        print(usage)
        return 0

    try:
        args = parser.parse_args()
    except SystemExit:
        return 2

    root = Path(__file__).resolve().parent
    src_dir = root / "src"
    tb_dir = root / "tb"
    outputs_dir = root / "outputs"

    if not src_dir.exists() or not tb_dir.exists():
        print("Expected 'src' and 'tb' folders next to this script.", file=sys.stderr)
        return 1

    try:
        src_file = resolve_file(args.verilog_file, root)
        tb_file = resolve_file(args.testbench_file, root)
    except FileNotFoundError:
        print(usage)
        return 2

    if shutil.which("iverilog") is None:
        print("Error: 'iverilog' not found in PATH.", file=sys.stderr)
        return 1
    if shutil.which("vvp") is None:
        print("Error: 'vvp' not found in PATH.", file=sys.stderr)
        return 1

    outputs_dir.mkdir(exist_ok=True)

    out_path = outputs_dir / f"{tb_file.stem}.out"

    compile_cmd = [
        "iverilog",
        "-g2012",
        "-o",
        str(out_path),
        str(tb_file),
        str(src_file),
    ]
    rc = run(compile_cmd, cwd=root)
    if rc != 0:
        print("Compile failed.", file=sys.stderr)
        return rc

    sim_cmd = ["vvp", str(out_path)]
    rc = run(sim_cmd, cwd=root)
    if rc != 0:
        print("Simulation failed.", file=sys.stderr)
        return rc

    if args.wave:
        if shutil.which("gtkwave") is None:
            print("Warning: 'gtkwave' not found in PATH. Skipping waveform open.", file=sys.stderr)
        else:
            vcd_path = outputs_dir / f"{tb_file.stem}.vcd"

            if vcd_path.exists():
                wave_cmd = ["gtkwave", str(vcd_path)]
                print(f"[cmd] {' '.join(wave_cmd)}")
                subprocess.Popen(wave_cmd, cwd=str(root))
            else:
                print(
                    f"Warning: VCD file not found at {vcd_path}. "
                    "Add $dumpfile/$dumpvars in the testbench.",
                    file=sys.stderr,
                )

    print(f"Simulation completed successfully. Output executable: {out_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
