require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    FactoryBot.create(:user, name: 'Abebe')
  end

  describe 'validate data' do
    it 'name should be present' do
      user.name = ''
      expect(user).to_not be_valid
    end

    it 'name should be present' do
      user.name = 'kebede'
      expect(user).to be_valid
    end
  end
end