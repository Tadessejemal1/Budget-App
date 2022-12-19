class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_categories, dependent: :delete_all
  
  validates :name, presence: true
  validates :icon, presence: true
end
