module PostingsHelper
  def posting_view_select(user, current_view)
    if user.kind_of? Employer
      options = [["View All Active Posts", "active"], ["View All of My Posts", "owned"]]
    elsif user.kind_of?(Student) && user.is_admin?
      options = [["View All Active Posts", "active"], ["View All Posts", "all"]]
    else
      options = [["View All Active Posts", "active"], ["Recommended for Me", "interests"]]
    end

    if not options.nil?
      html = select_tag "view", options_for_select(options, current_view)
    else
      html = ""
    end

    return html.html_safe
  end

  def editable_tag_for(tag)
    html = "<div class=\"token\">#{tag.name} <span class=\"removetag\">x</span></div>"
    return html.html_safe
  end
end
