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
class ExpenseCategory < ApplicationRecord
  belongs_to :category
  belongs_to :expense

  def self.save_category(category, expense)
    @expense_category = ExpenseCategory.new(category:, expense:)
    return true if @expense_category.save

    false
  end
end
