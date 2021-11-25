FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    birth                 {"2021/01/01"}
    last_name             {"はむ太郎"}
    last_name_kana        {"ハムタロウ"}
    first_name            {"とっとこ"}
    first_name_kana       {"トットコ"}
  end
end
