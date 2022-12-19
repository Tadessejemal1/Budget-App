FactoryBot.define do
  factory :category do
    name { 'Food and Drinks' }
    icon { 'http://icons-qemer/png' }
    author { 1 }
  end
end
