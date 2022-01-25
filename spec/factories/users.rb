FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name_full { "山田" }
    first_name_full { "太郎" }
    last_name_half { "ヤマダ" }
    first_name_half { "タロウ" }
    birthday { "1993-04-13" }
  end
end
