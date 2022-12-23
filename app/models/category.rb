# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  icon       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#
# Indexes
#
#  index_categories_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_categories, dependent: :destroy, foreign_key: :author_id

  validates :name, presence: true
  validates :icon, presence: true
end
