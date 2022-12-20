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
FactoryBot.define do
  factory :expense do
    name { 'Omlet breakfast' }
    amount { 75.5 }
    author { 1 }
  end
end
