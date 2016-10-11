module ApplicationHelper

  # Returnthe full title on a per-page basis
  def full_title(page_title = '')
    base_title= 'MyTut App'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def human_boolean(boolean)
    boolean ? 'Yes' : 'No'
  end
end
