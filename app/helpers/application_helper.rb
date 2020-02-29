module ApplicationHelper

def link_to_in_a(body, url, html_options = {})
  current_page?(url) ? active = "btn nav-tab active" : active = "btn nav-tab"
  content_tag :div, class: active do
    link_to body, url, html_options
  end
end

end
