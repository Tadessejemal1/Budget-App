# == Schema Information
#
# Table name: expense_categories
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :expense_category do
    name { 'Omlet breakfast' }
    amount { 75.5 }
    author { 1 }
  end
end
