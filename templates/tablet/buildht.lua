local filter = require("make4ht-filter")
local process = filter {
  function(text)
    return text:gsub("font%-family: 'TeXGyreTermesX', serif;", "font-family: 'Times New Roman', times, serif;")
  end,
}
Make:match("css", process)