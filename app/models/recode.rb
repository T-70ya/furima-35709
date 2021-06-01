class Recode < ApplicationRecord
  has_one :buy
  belongs_to :user
  belongs_to :item
end
