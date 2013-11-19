module ApplicationHelper

  def date datetime
    "#{datetime.to_date.to_s}"
  end

  def linkable_title collection
    collection.each {|item| item.title = link_to item.title, item}
  end

  def tags(item)
    if item.respond_to?(:tag_list) && !item.tag_list.empty?
      content_tag(:span,'', class: "glyphicon glyphicon-tags") + content_tag(:span, item.tag_list)
    end
  end

  def escape(item)
    URI.encode(item)
  end
end
