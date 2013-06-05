module SiteHelpers

  def page_title
    title = "Aircart"
    if data.page.title
      title << " | " + data.page.title
    end
    title
  end
  
  def page_description
    if data.page.description
      description = data.page.description
    else
      description = "Mobile self-checkout solution for grocery markets."
    end
    description
  end

end