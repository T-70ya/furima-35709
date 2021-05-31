FactoryBot.define do
  factory :recode_buy do
    postcode {"123-4567"}
    area_id {5}
    city {"横浜市緑区"}
    address {"青山1-1-1"}
    build {" "}
    number {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end