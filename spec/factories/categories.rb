# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  icon       :string           not null
#  name       :string           not null
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
FactoryBot.define do
    factory :category do
      name { 'Food and Drinks' }
      icon { 'http://icons-buget/png' }
      author { 1 }
    end
  end