from argparse import ArgumentParser
from pathlib import Path
import shutil

parser = ArgumentParser(description='Create a new LaTeX project from a template')

############## DEFAULTS ##############
DEFAULT_TEMPLATE = 'tablet/article'
DEFAULT_FILENAME = 'main'
DEFAULT_PACKAGES = ''
######################################

parser.add_argument('projectfolder', type=Path)
parser.add_argument('-t', '--template', default=DEFAULT_TEMPLATE,
                    choices=['tablet/article','tablet/report','slides/beamer'])
parser.add_argument('-f', '--filename', default=DEFAULT_FILENAME)
parser.add_argument('-p', '--packages', default=DEFAULT_PACKAGES,
                    help='Comma-separated list')

args = parser.parse_args()

template = args.template.split('/')
packages = map(lambda x: x + '.sty', args.packages.split(',')) if len(args.packages) > 0 else []
files = [ { 'src': template[1]+'.tex', 'dst': args.filename+'.tex' } ]

if template[0] == 'slides':
    files.extend([
        { 'src': 'beamer43.svg' },
        { 'src': 'beamer169.svg' },
        { 'src': 'OU_Master_LOGO_WHITE_63mm.eps' },
        { 'src': 'slides.cls' }
    ])
else:
    files.extend([
        { 'src': 'tablet_154x205.svg' },
        { 'src': 'OU_Master_LOGO_BLACK_63mm.eps' },
        { 'src': 'tablet.cls' },
    ])

args.projectfolder.mkdir(parents=True, exist_ok=True)
shutil.copy('.gitignore', str(args.projectfolder / '.gitignore'))
for file in files:
    src = file['src']
    dst = file.get('dst', src)
    shutil.copyfile('templates/' + template[0] + '/' + src, str(args.projectfolder / dst))
for package in packages:
    shutil.copyfile('packages/' + package, str(args.projectfolder / package))