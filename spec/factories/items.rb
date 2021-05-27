FactoryBot.define do
  factory :item do
    name             {'商品名'}
    info             {'詳細な説明'}
    category_id      {'3'}
    status_id        {'3'}
    haisoryo_id      {'3'}
    area_id          {'3'}
    day_id           {'3'}
    price            {'300'}
    association :user
  end
end
