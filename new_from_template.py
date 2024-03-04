from argparse import ArgumentParser, RawTextHelpFormatter, ArgumentDefaultsHelpFormatter
from pathlib import Path
import shutil

class HelpFormatter(RawTextHelpFormatter, ArgumentDefaultsHelpFormatter):
    pass

scriptdir = Path(__file__).parent.resolve()
package_help = '\n    '.join(map(lambda p: p.stem, Path(scriptdir / 'packages/').glob("*.sty")))
parser = ArgumentParser(description='Create a new LaTeX project from a template',
                        formatter_class=HelpFormatter)

############## DEFAULTS ##############
DEFAULT_TEMPLATE = 'tablet/article'
DEFAULT_FILENAME = 'main'
DEFAULT_PACKAGES = ''
######################################

parser.add_argument('projectfolder', type=Path)
parser.add_argument('-t', default=DEFAULT_TEMPLATE, dest='template',
                    help='Template',
                    choices=['tablet/article','tablet/report','slides/beamer'])
parser.add_argument('-f', dest='filename', metavar='FILENAME', default=DEFAULT_FILENAME,
                    help='Main file will be FILENAME.tex')
parser.add_argument('-p', dest='packages', metavar='PACKAGES', default=DEFAULT_PACKAGES,
                    help='Comma-separated list of packages from:\n    '+package_help+'\n')

args = parser.parse_args()

template = args.template.split('/')
packages = map(lambda x: x + '.sty', args.packages.split(',')) if len(args.packages) > 0 else []
files = [ { 'src': template[1]+'.tex', 'dst': args.filename+'.tex' } ]

if template[0] == 'slides':
    files.extend([
        { 'src': 'beamer43.svg' },
        { 'src': 'beamer85.svg' },
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
shutil.copy('tex.mplstyle', str(args.projectfolder / 'tex.mplstyle'))
shutil.copy('mpl.py', str(args.projectfolder / (args.filename + '.py')))
for file in files:
    src = file['src']
    dst = file.get('dst', src)
    shutil.copyfile('templates/' + template[0] + '/' + src, str(args.projectfolder / dst))
for package in packages:
    shutil.copyfile('packages/' + package, str(args.projectfolder / package))