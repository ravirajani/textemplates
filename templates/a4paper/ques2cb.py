import sys
import re
import pyperclip
from string import ascii_lowercase
from tex2html import tohtml

filename = len(sys.argv) > 1 and sys.argv[1] or exit('No filename provided')

def startswith(line, token, type='start'):
    if type == 'start':
        return line.startswith(r'\begin{'+token)
    else:
        return line.startswith(r'\end{'+token)

with open(filename, encoding='utf-8') as f:
    while True:
        instring = input('Question number (or q to quit): ').strip() or 0
        if instring == 'q':
            break
        question = int(instring)
        qcount = 0 # question count
        subquestion = 0
        token = 'question' if question > 0 else 'instructions'
        found = False
        resume = False
        nodescription = False
        output = '<p>'
        for line in f:
            line = re.sub(r'(^[ \t]*)', '', line)
            if startswith(line, token):
                if token == 'question':
                    qcount += 1
                if qcount == question:
                    found = True
            if found and startswith(line, token, 'end'):
                break
            if found and not startswith(line, token):
                if token == 'instructions':
                    line = line.replace(r'\item','')
                if line.startswith(r'\nodescription'):
                    nodescription = True
                if line.startswith(r'\begin{subparts}[resume]'):
                    resume = True
                if line.startswith('\\subpart') or startswith(line, 'subparts', 'end'):
                    pyperclip.copy(output[:-3] if output[-3:] == '<p>' else output.strip() +'</p>')
                    output = '<p>'
                    subquestion += 1
                    if resume:
                        print(f'Copied description before Q{question}{ascii_lowercase[subquestion-2]} to clipboard')
                        input('Type ENTER to continue... ')
                        subquestion -= 1
                        resume = False
                    elif subquestion > 1:
                        print(f'Copied Q{question}{ascii_lowercase[subquestion-2]} to clipboard')
                        input('Type ENTER to continue... ')
                    elif not nodescription:
                        print(f'Copied Q{question} to clipboard')
                        input('Type ENTER to continue... ')
                    line = re.sub(r'\\subpart(\[.*?\])?','', line)
                if line.startswith('\n'):
                    output = output.strip() + '</p>\n<p>'
                else:
                    line = tohtml(line[:-1])
                    output += line + ' '
        pyperclip.copy(output.strip() + '</p>')
        if subquestion == 0:
            print(f'Copied Q{question} to clipboard')
        f.seek(0)
