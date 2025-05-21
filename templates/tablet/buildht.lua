local domfilter = require("make4ht-domfilter")
local filter = require("make4ht-filter")
local process = filter {
  function(text)
    -- we use Lua patterns, so - in font-family needs to be escaped using %-
    return text:gsub("font%-family: 'TeXGyreTermesX', serif;", "font-family: 'Times New Roman', times, serif;")
  end,
}
local domprocess = domfilter("collapsetoc")
Make:match("css", process)
Make:match("html$", domprocess, {toc_query="nav.TOC"})
