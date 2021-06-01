class RecodeBuy
  include ActiveModel::Model
  attr_accessor :postcode, :area_id, :city, :address, :build, :number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, messages: "郵便番号はハイフンを入れてください" }
    validates :city
    validates :address
    validates :number, format: {with: /\A\d{1,2,3,4,5,6,7,8,9,10,11}\z/ }
    validates :area_id, numericality: { other_than: 1 }
    validates :user_id
    validates :item_id
    validates :token
  end


  def save
    recode = Recode.create(user_id: user_id, item_id: item_id)
    Buy.create(postcode: postcode, area_id: area_id, city: city, address: address, build: build, number: number, recode_id: recode.id)
  end
end
