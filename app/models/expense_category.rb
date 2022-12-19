# == Schema Information
#
# Table name: expense_categories
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ExpenseCategory < ApplicationRecord
    belongs_to :category
    belongs_to :expense
end
