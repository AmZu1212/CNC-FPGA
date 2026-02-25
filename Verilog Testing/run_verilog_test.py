#!/usr/bin/env python3
"""
Compile and run a Verilog testbench with iverilog/vvp.

Usage examples:
  python run_verilog_test.py IntSqrt64.v IntSqrt64_tb.v
  python run_verilog_test.py IntSqrt64 IntSqrt64_tb
  python run_verilog_test.py IntSqrt64 IntSqrt64_tb --wave
"""

from __future__ import annotations

import argparse
import shutil
import subprocess
import sys
from pathlib import Path


def resolve_file(base_dir: Path, name: str) -> Path:
    candidate = Path(name)
    if candidate.suffix == "":
        candidate = candidate.with_suffix(".v")

    if candidate.is_absolute():
        if not candidate.exists():
            raise FileNotFoundError(f"File not found: {candidate}")
        return candidate

    resolved = base_dir / candidate
    if not resolved.exists():
        raise FileNotFoundError(f"File not found: {resolved}")
    return resolved


def run(cmd: list[str], cwd: Path) -> int:
    print(f"[cmd] {' '.join(cmd)}")
    completed = subprocess.run(cmd, cwd=str(cwd))
    return completed.returncode


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Compile and run a Verilog testbench using iverilog + vvp."
    )
    parser.add_argument("verilog_file", help="Verilog source file in src/ (with or without .v)")
    parser.add_argument("testbench_file", help="Testbench file in tb/ (with or without .v)")
    parser.add_argument(
        "-o",
        "--output",
        default=None,
        help="Output executable name (default: <testbench_stem>.out in outputs/)",
    )
    parser.add_argument(
        "--wave",
        action="store_true",
        help="Open GTKWave after simulation.",
    )
    parser.add_argument(
        "--vcd",
        default=None,
        help="Waveform file to open with --wave (default: outputs/<testbench_stem>.vcd).",
    )
    args = parser.parse_args()

    root = Path(__file__).resolve().parent
    src_dir = root / "src"
    tb_dir = root / "tb"
    outputs_dir = root / "outputs"

    if not src_dir.exists() or not tb_dir.exists():
        print("Expected 'src' and 'tb' folders next to this script.", file=sys.stderr)
        return 1

    src_file = resolve_file(src_dir, args.verilog_file)
    tb_file = resolve_file(tb_dir, args.testbench_file)

    if shutil.which("iverilog") is None:
        print("Error: 'iverilog' not found in PATH.", file=sys.stderr)
        return 1
    if shutil.which("vvp") is None:
        print("Error: 'vvp' not found in PATH.", file=sys.stderr)
        return 1

    outputs_dir.mkdir(exist_ok=True)

    out_name = args.output if args.output else f"{tb_file.stem}.out"
    out_path = outputs_dir / out_name

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
            vcd_path = Path(args.vcd) if args.vcd else (outputs_dir / f"{tb_file.stem}.vcd")
            if not vcd_path.is_absolute():
                vcd_path = root / vcd_path

            if vcd_path.exists():
                wave_cmd = ["gtkwave", str(vcd_path)]
                print(f"[cmd] {' '.join(wave_cmd)}")
                subprocess.Popen(wave_cmd, cwd=str(root))
            else:
                print(
                    f"Warning: VCD file not found at {vcd_path}. "
                    "Add $dumpfile/$dumpvars in the testbench or pass --vcd <path>.",
                    file=sys.stderr,
                )

    print(f"Simulation completed successfully. Output executable: {out_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
