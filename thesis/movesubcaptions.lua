function Figure(elem)
  quarto.log.output("============ Lua filter =================")
  quarto.log.output(elem)
  print(elem)
  print("XXXXXXXXXXXXXX")
  io.stderr:write(elem)
  if elem.t == "Figure" and elem.caption then
    local main_caption = elem.caption[1].text
    local subcaptions = {}
    for _, subfig in ipairs(elem.content) do
      if subfig.t == "Figure" and subfig.caption then
        table.insert(subcaptions, subfig.caption[1].text)
      end
    end

    if #subcaptions > 0 then
      elem.caption[1].text = main_caption .. " " .. table.concat(subcaptions, " ")
    end
  end
  return elem
end

-- return {
--   { Figure = concatenate_subcaptions }
-- }

-- function Header(el)
--   if el.level == 4 then
--     local name = pandoc.utils.stringify(el.content[3])
--     local number = ""
--     if el.attr then
--       number = el.attr.attributes.number:gsub("%.0%.0%.", "-")
--     end
--     el.content =  pandoc.Strong(name .. " " .. number)
--     return el
--   end
-- end

