class RecodesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @recode_buy = Recode.new
  end

  def create
    @recode_buy = RecodeBuy.new(params_recode)
    if @recode_buy.valid?
      @recode_buy.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def params_recode
    params.require(:recode_buy).permit(:postcode, :area_id, :city, :address, :build, :number, :image, :price, :haisoryo_id, :user_id, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
