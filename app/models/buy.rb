class Buy < ApplicationRecord
  belongs_to :recode
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

 
end
