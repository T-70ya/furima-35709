class RecodesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find, only: [:index, :create]
  before_action :sold_out_item, only: [:index, :create]


  def index
    @recode_buy = RecodeBuy.new
  end

  def create
    @recode_buy = RecodeBuy.new(params_recode)
    if @recode_buy.valid?
      pey_item
      @recode_buy.save
      redirect_to root_path
    else 
      render :index
    end
  end


  private

  def params_recode
    params.require(:recode_buy).permit(:postcode, :area_id, :city, :address, :build, :number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pey_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params_recode[:token],
      currency: 'jpy'
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def sold_out_item
    if @item.user_id == current_user.id || @item.recode.present?
      redirect_to root_path
    end
  end
end
