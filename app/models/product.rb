class Product < ActiveRecord::Base
  attr_accessible :name, :price, :body, :product_id, :rating, :image, :in_cart

  has_many :reviews

  validates_uniqueness_of :name
  validates_presence_of :price

  

end
