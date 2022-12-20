# == Schema Information
#
# Table name: expense_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  expense_id  :bigint           not null
#
# Indexes
#
#  index_expense_categories_on_category_id  (category_id)
#  index_expense_categories_on_expense_id   (expense_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (expense_id => expenses.id)
#
FactoryBot.define do
  factory :expense_category do
    name { 'Omlet breakfast' }
    amount { 75.5 }
    author { 1 }
  end
end
