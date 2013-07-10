class CartBook < ActiveRecord::Base
  attr_accessible :book_id, :cart_id, :num
  belongs_to :cart
  belongs_to :book
  scope :groupByBook,group("book_id")
end
