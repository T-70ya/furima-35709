class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :edit_ng, only: :edit

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params_item)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(params_item)
      redirect_to action: :show
    else
      render :edit
    end
  end


  private

  def params_item
    params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :haisoryo_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def edit_ng
    @item = Item.find(params[:id])
    unless user_signed_in? && @item.user.id == current_user.id
      redirect_to root_path
    end
  end
end
