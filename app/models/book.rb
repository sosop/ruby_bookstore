# encoding: utf-8
class Book < ActiveRecord::Base
  attr_accessible :description, :name, :price, :publish_status, :publish_date,:stock,:category_id
  belongs_to :category
  belongs_to :cart
  has_many :cart_books,:dependent => :destroy
  has_many :carts,:through => :cart_books
  validates :name, presence:true, length: {maximum: 20, minimum: 5}
  validates :price, presence:true, numericality: {greater_than: 0.01}

  scope :published, where(["publish_status = ?",1])
  scope :price_order,order("price desc")
  scope :stocked,where(["stock = ?",1])
  scope :order_by_publish_date,order("publish_date desc")
  

  Status = {
    0 => "未发布",
    1 => "已发布"
  }

  Stock = {
    0 => "缺货",
    1 => "有货"
  }


  def get_num(cart)
    CartBook.where("cart_id = ? and book_id = ?",cart.id,self.id).first.num
  end


  def get_total(cart)
    sprintf("%.2f",self.price * get_num(cart)).to_f
  end
end
