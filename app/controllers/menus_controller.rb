class MenusController < ApplicationController
	#before_action :set_menus, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
     @menus = Menu.all
  end

  def show
     @menu = Menu.find(params[:id])
     
  end

  def new
     # @menu = Menu.new
    @menu = current_user.menus.build
  end

  def create
      # debugger
    # @menu = Menu.new(menu_params)
    # @menu = current_user.menus.create(my_params)
    @menu = current_user.menus.create(my_params)
   # @menu.save


     respond_to do |format|
       if @menu.save
        format.html { redirect_to menu_url(@menu), notice: "menu was successfully created." }
    #     format.json { render :show, status: :created, location: @menu }
       else
        format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @menu.errors, status: :unprocessable_entity }
    end
    end
  end

  def edit
     @menu = Menu.find(params[:id])
      redirect_to @menu

      # redirect_to menu_url(@menu)
  end

  def update
     @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      redirect_to @menu
    else
      render :edit, status: :unprocessable_entity
  end
end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to menus_url, notice: "item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  #def set_menus
      #@menu = Menu.find(params[:id])
  #end
  def my_params
     # debugger
      params.require(:menu).permit(:name, :food_name, :quantity, :image)
  end


end