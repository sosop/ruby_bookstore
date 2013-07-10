# encoding: utf-8
class Category < ActiveRecord::Base
  attr_accessible :name, :priority, :publish_status
  has_many :books
  validates :name, presence:true, length: {maximum: 10, minimum: 5}
  validates :publish_status, numericality: true

  scope :published, where(["publish_status = ?",1])
  scope :priority_order,order("priority desc")
  

  Status = {
    0 => "未发布",
    1 => "已发布"
  }

end
