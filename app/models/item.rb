class Item < ApplicationRecord
  expend ActiveHash::Association::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :haisoryo
  belongs_to :area
  belongs_to :day

  belongs_to :user

  with_options presence: true do
    validates :name
    validates :info
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :haisoryo_id
    validates :area_id
    validates :day_id
  end
end
