class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :item, counter_cache: :favorites_count
end
