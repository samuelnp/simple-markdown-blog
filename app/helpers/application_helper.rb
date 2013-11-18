module ApplicationHelper

  def date datetime
    "#{datetime.to_date.to_s}"
  end

  def linkable_title collection
    collection.each {|item| item.title = link_to item.title, item}
  end
end
