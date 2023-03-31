import os.path
import pathlib
import subprocess

ASY_CMD = "asy"

FORMATS = ["pdf", "svg"]

def compile_if_needed(p, _format="pdf"):
    q = p.with_suffix("." + _format)
    if not(q.exists()) or (os.path.getmtime(q) < os.path.getmtime(p)):
        print(f"{p} → {q}")
        args = ["asy", "-f", _format, str(p)]
        subprocess.run(["asy", "-f", _format, "--nopdfreload", "--noView", p])

if __name__ == "__main__":
    for p in pathlib.Path(".").glob("fig*.asy"):
        for _format in FORMATS:
            compile_if_needed(p, _format)
