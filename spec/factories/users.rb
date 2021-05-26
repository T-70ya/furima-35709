FactoryBot.define do
  factory :user do
    nickname                 {Faker::Name.last_name}
    email                    {Faker::Internet.email}
    password                 {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation    {password}
    lastname                 {"山田"}
    firstname                {"太郎"}
    furiganalast             {"ヤマダ"}
    furiganafirst            {"タロウ"}
    birthday                 {Faker::Date.birthday}
  end
end
