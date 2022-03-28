class ShopController < ApplicationController

	def index

		@menus = Menu.all
	end
end
