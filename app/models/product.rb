class Product < ActiveRecord::Base
belongs_to :inventories
validates_presence_of :price, :title, :description, :image_url
validates_numericality_of :price, :greater_than => 0.01
validates_uniqueness_of :title
validates_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i,
  :message => "URL Invalid"
validates_numericality_of :Projection, :greater_than => 0

end
