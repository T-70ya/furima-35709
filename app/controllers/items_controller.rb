class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :ryaku, only: [:show, :edit, :update, :destroy]
  before_action :edit_ng, only: [:edit, :update, :destory]
  

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

  end

  def edit

  end

  def update
    if @item.update(params_item)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end


  private

  def params_item
    params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :haisoryo_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def edit_ng
    unless @item.user.id == current_user.id && @item.recode.blank?
      redirect_to root_path
    end
  end

  def ryaku
    @item = Item.find(params[:id])
  end
end
