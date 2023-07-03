--[[
  This file defines the shortcodes that your extension will make available
  https://quarto.org/docs/authoring/shortcodes.html#custom-shortcodes
  Quarto exports utils function that can be used in all filters. See 
  https://github.com/quarto-dev/quarto-cli/blob/main/src/resources/pandoc/datadir/init.lua#L1522-L1576
]]--

-- Example shortcode that provides a nicely formatted 'LaTeX' string
function latex()
  if quarto.doc.isFormat("pdf") then
    return pandoc.RawBlock('tex', '{\\LaTeX}')
  elseif quarto.doc.isFormat("html") then
    return pandoc.Math('InlineMath', "\\LaTeX")
  else 
    return pandoc.Span('LaTeX')
  end
end

function tex()
  if quarto.doc.isFormat("pdf") then
    return pandoc.RawBlock('tex', '{\\TeX}')
  elseif quarto.doc.isFormat("html") then
    return pandoc.Math('InlineMath', "\\TeX")
  else 
    return pandoc.Span('TeX')
  end
end

-- shortcode that provides a nicely formatted 'bibtex' string
function bibtex()
  if quarto.doc.is_format("pdf") then
    return pandoc.RawBlock('tex', '\\textsc{Bib}{\\TeX}')
  elseif quarto.doc.is_format("html") then
    return pandoc.RawBlock('html', '<span style="font-variant: small-caps;">Bib</span><span style="letter-spacing:-2px;">T</span><sub style="font-size: inherit; letter-spacing:-1px;">E</sub>X')
  else
    return pandoc.Span('BibTeX')
  end
end

function ldots()
  if quarto.doc.is_format("pdf") then
    return pandoc.RawBlock('tex', '\\ldots')
  elseif quarto.doc.is_format("html") then
    return pandoc.RawBlock('html', '&#8230;')
  else
    return "..."
  end
end

function vdots()
  if quarto.doc.is_format("pdf") then
    return pandoc.Math('InlineMath', "\\vdots")
  elseif quarto.doc.is_format("html") then
    return pandoc.RawBlock('html', '&#8942;')
  else
    return "..."
  end
end

function ddots() 
  if quarto.doc.is_format("pdf") then
    return pandoc.Math('InlineMath', "\\ddots")
  elseif quarto.doc.is_format("html") then
    return pandoc.RawBlock('html', '&#8945;')
  else
    return "..."
  end
end

function pct()
  local pct
  if quarto.doc.is_format("pdf") then
    return pandoc.Math('InlineMath', '\\%')
  else 
    return pandoc.Str("%")
  end
end
