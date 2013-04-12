class Review < ActiveRecord::Base
  attr_accessible :body, :product_id, :rating

  belongs_to :product

  validates_length_of :body, :within => 50..1000
  validates_inclusion_of :rating, :in => 0..5
end
