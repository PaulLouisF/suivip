module ApplicationHelper
  def active_class(nav_path)
    current_page?(nav_path) ? "btn nav-tab active" : "btn nav-tab"
   end
end
