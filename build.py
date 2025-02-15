from argparse import ArgumentParser, BooleanOptionalAction
from pathlib import Path

VERSION_FILE = 'version.txt'

scriptdir = Path(__file__).parent.resolve()

parser = ArgumentParser(description='Build latex project and update version if needed')
parser.add_argument('files', nargs='+', type=Path)
parser.add_argument('--major', default=False, action=BooleanOptionalAction)
parser.add_argument('--minor', default=False, action=BooleanOptionalAction)
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

with open(VERSION_FILE, 'r+') as f:
    version = f.read()
    major, minor = version.split('.')
    if args.major:
        major = int(major) + 1
        minor = 0
    if args.minor:
        minor = int(minor) + 1
    version = f'{major}.{minor}'

    if args.major or args.minor:
        f.seek(0)
        f.write(version)
        f.truncate()

build_str = f"{build_cmd['command']} {' '.join(build_cmd['args'])}"
for file in args.files:
    print(build_str + f' -jobname={file.stem}_v{version}.pdf {file}')
