function Para(el)
  if #el.content > 0 and el.content[1].t == "Str" then
    local text = el.content[1].text

    -- Match `[!Note]`, `[!Warning]`, `[!Tip]`, `[!Important]`
    local admonitionType = text:match("^%[%!(%w+)%]$")

    if admonitionType then
      -- Remove `[!Note]` from content
      table.remove(el.content, 1)

      -- Define class based on type
      local classMap = {
        Note = "note",
        Warning = "warning",
        Tip = "tip",
        Important = "important"
      }
      local class = classMap[admonitionType] or "note"

      -- Create title with an empty span for the icon
      local title = pandoc.Div({
        pandoc.RawInline("html", '<span class="admonition-icon"></span>'),
        pandoc.Str(admonitionType)
      }, pandoc.Attr("", { "admonition-title", class }))

      -- Wrap remaining content inside an admonition div
      return pandoc.Div({ title, pandoc.Para(el.content) }, pandoc.Attr("", { "admonition", class }))
    end
  end

  return el
end
