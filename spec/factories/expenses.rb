FactoryBot.define do
  factory :expense do
    name { 'Omlet breakfast' }
    amount { 75.5 }
    author { 1 }
  end
end
