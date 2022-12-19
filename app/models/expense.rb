class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_categories, dependent: :delete_all
  
  validates :name, presence: true
  validates :amount, comparison: { greater_than: 0.0 }, numericality: true
end
