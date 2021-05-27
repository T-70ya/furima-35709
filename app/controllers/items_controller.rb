class ItemsController < ApplicationController
  before_action :authenticate_user!, expect: [:index]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(params_item)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def params_item
    params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :haisoryo_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
