def page_title
  title = "Dan Nguyen Code/Words" #Set site title here

  if data.page.title
    title << " | " + data.page.title
  end

  title
end

def page_description
  description = "A Static Site Generator" # Set site description here

  if data.page.description
    description = data.page.description
  end

  description
end

def page_keywords
  keywords = [] # Set site keywords here

  if data.page.keywords
    keywords.concat(data.page.keywords)
  end

  keywords.uniq.join(", ")
end

def make_markdown(str)
  Kramdown::Document.new(str.to_s).to_html
end

def image_tag_var(sizename, fstr, *args)
  n = fstr.sub(/(?=\.\w+$)/, ".#{sizename}")

  image_tag(n, *args)
end

def friendly_date(val)
  if val =~ /^\d+/
    date = Chronic.parse(val)
    
    return date.strftime '%B %Y'
  else
    return val
  end
end