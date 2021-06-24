module Jekyll
   module StringFilter
    def endswith(text, query)
      return text.end_with? query
    end
  end
end
  
Liquid::Template.register_filter(Jekyll::StringFilter)
