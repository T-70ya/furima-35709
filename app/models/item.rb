class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :haisoryo
  belongs_to :area
  belongs_to :day

  belongs_to :user
  has_one :recode
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :info
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :image
  end
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :haisoryo_id
    validates :area_id
    validates :day_id
  end


end
