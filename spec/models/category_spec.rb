# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  icon       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Category, type: :model do
  user = User.first
  let(:category) do
    FactoryBot.create(:category,
                      name: 'Housing',
                      icon: 'icon-url',
                      author: user)
  end

  describe 'validate' do
    it 'name should be present' do
      category.name = ''
      expect(category).to_not be_valid
    end

    it 'name is present' do
      category.name = 'Vehicle'
      expect(category).to be_valid
    end
    it 'icon should be present' do
      category.icon = ''
      expect(category).to_not be_valid
    end

    it 'icon is present' do
      category.name = 'new-icon-url'
      expect(category).to be_valid
    end
  end
end
