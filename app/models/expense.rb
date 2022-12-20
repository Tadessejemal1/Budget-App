# == Schema Information
#
# Table name: expenses
#
#  id         :bigint           not null, primary key
#  amount     :decimal(, )      default(0.0)
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#
# Indexes
#
#  index_expenses_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_categories, dependent: :delete_all

  validates :name, presence: true
  validates :amount, comparison: { greater_than: 0.0 }, numericality: true
end
