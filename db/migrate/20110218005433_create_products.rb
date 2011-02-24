class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
	  t.integer :id
	  t.text :title
	  t.text :description
	  t.text :image_url
	  t.integer :price , :decimal, :precision =>2, :scale =>2
	  t.integer :Projection
	  t.integer :Amount

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
