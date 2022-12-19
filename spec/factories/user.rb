FactoryBot.define do
    factory :user do
      name { 'Abebe' }
      email { 'abebe@mail.com' }
      password { '123456' }
      password_confirmation { '123456' }
  
      trait :confirmed do
        confirmed_at { Time.zone.now }
        confirmation_sent_at { Time.zone.now }
        confirmation_token { '12345' }
      end
    end
end
