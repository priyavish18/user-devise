class Menu < ApplicationRecord
	belongs_to :user
	has_many :order_items
	has_many :orders
	has_one_attached :image

end
