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
class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_categories, dependent: :delete_all

  validates :name, presence: true
  validates :amount, comparison: { greater_than: 0.0 }, numericality: true
end
