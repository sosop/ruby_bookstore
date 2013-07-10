module ApplicationHelper
  def categories
    Category.published.all
  end


  def hot_books
   Book.published.order_by_publish_date.first(4) 
  end
end
