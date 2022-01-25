FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name_full {Gimei.last.kanji}
    first_name_full {Gimei.first.kanji}
    last_name_half {Gimei.last.katakana}
    first_name_half {Gimei.first.katakana}
    birthday { "1993-04-13" }
  end
end
