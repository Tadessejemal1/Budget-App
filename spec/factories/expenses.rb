# == Schema Information
#
# Table name: expenses
#
#  id         :bigint           not null, primary key
#  amount     :decimal(, )
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :expense do
    name { 'Omlet breakfast' }
    amount { 75.5 }
    author { 1 }
  end
end
