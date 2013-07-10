class Cart < ActiveRecord::Base
  #attr_accessible :num,:book_id
  #validate :num, numericality: {greater_than:0,only_integer:true}
  has_many :cart_books, :dependent => :destroy
  has_many :books,:through => :cart_books


  def total_price
    sum = 0.0
    self.books.each do |book|
      sum = sum + book.get_total(self)
    end
    sum
  end
end
