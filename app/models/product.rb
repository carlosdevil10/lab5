class Product < ActiveRecord::Base
belongs_to :inventories
validates_presence_of :price, :title, :description, :image_url
validates_numericality_of :price, :greater_than => 0.01
validates_uniqueness_of :title
validates_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i,
  :message => "URL Invalid"
validates_numericality_of :Projection, :greater_than => 0

before_create :crear_Invent
after_update :actu_Invent
after_destroy : elim_Invent

def crear_Invent
	amount = 0
	Inven = inventory.new
	Inven.previous_balance = 0
	Inven.new_balance = amount
	Inven.future_balance = amount + projection
	Inven.save
	end

def actu_Invent
	Inven = inventory.new
	anterior = inventory.where("product_id = id").last
	Inven.previous_balance = anterior.new_balance
	Inven.new_balance=amount
	Inven.fture_balance = amount + projection
	Inven.save
	end
	
def elim_Invet
	anterior = inventories.find_by_product_id(id)
	anterior.each do |maje|
	maje.delete
end
	
	
	
end
