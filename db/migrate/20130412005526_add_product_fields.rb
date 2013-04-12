class AddProductFields < ActiveRecord::Migration
  def up
    add_column :products, :body, :text
    add_column :products, :image, :string
    add_column :products, :in_cart, :boolean
  end

  def down
  end
end
