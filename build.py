from argparse import ArgumentParser, BooleanOptionalAction
from pathlib import Path
import subprocess

VERSION_FILE = 'version.txt'

scriptdir = Path(__file__).parent.resolve()

parser = ArgumentParser(description='Build LaTeX project and update version if needed')
parser.add_argument('files', nargs='+', type=Path, help='Space-separated list of LaTeX files to build')
parser.add_argument('--major', default=False, action=BooleanOptionalAction, help='Bump major version number')
parser.add_argument('--minor', default=False, action=BooleanOptionalAction, help='Bump minor version number')
args = parser.parse_args()

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
        print('New version:', version)

for file in args.files:
    outfile = f'{file.stem}_v{version}'
    build_cmd = [
        'latexmk',
        '-shell-escape',
        '-emulate-aux-dir',
        '-aux-directory=aux',
        '-file-line-error',
        '-pdf',
        '-outdir=build',
        '-jobname='+outfile,
        str(file)
    ]
    p = subprocess.run(build_cmd)
    if p.returncode == 0:
        print("Done")
