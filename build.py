from argparse import ArgumentParser, FileType
from pathlib import Path

scriptdir = Path(__file__).parent.resolve()

parser = ArgumentParser(description='Build latex project and update version if needed')

parser.add_argument('files', nargs='+')

args = parser.parse_args()

build_cmd = {
    "command": "latexmk",
    "args": [
        "-shell-escape",
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "-pdf",
        "-outdir=out"
    ]
}

build_str = f"{build_cmd['command']} {' '.join(build_cmd['args'])} "
for f in args.files:
    print(build_str + f)