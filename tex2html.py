import re

def tohtml(texstring):
    texstring = texstring.replace('$','$$') \
        .replace('<', '&lt;') \
        .replace('>', '&gt;') \
        .replace('``','&ldquo;') \
        .replace("''",'&rdquo;') \
        .replace('---','&mdash;') \
        .replace('--','&ndash;') \
        .replace(r'\mleft', r'\left') \
        .replace(r'\mright', r'\right')
    texstring = re.sub(r'\\textbf\{(.+?)\}', r'<b>\1</b>', texstring)
    texstring = re.sub(r'\\textit\{(.+?)\}', r'<i>\1</i>', texstring)
    texstring = re.sub(r'\\(v|h)space\{.+?\}', '', texstring)
    texstring = re.sub(r'\\(begin|end)\{.+?\}', '', texstring)
    texstring = re.sub(r'\\label\{.+?\}', '', texstring)
    return texstring.strip()