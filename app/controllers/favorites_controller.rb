class FavoritesController < ApplicationController
  before_action :favo, only: [:create, :destroy]

  def create
    @favorite = Favorite.create(user_id: current_user.id, item_id: params[:item_id])
    @favorites = Favorite.where(item_id: params[:item_id])
    @item.reload
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, item_id: params[:item_id])
    favorite.destroy
    @favorites = Favorite.where(item_id: params[:item_id])
    @item.reload
  end

  private

  def favo
    @item = Item.find(params[:item_id])
  end
end
