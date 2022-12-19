require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { FactoryBot.create(:user, name: 'Abebe') }
  let(:expense) do
    FactoryBot.create(:expense,
                      name: 'Beef cheese toast',
                      amount: 110.0,
                      author: user)
  end

  describe 'validate' do
    it 'name should be present' do
      expense.name = ''
      expect(expense).to_not be_valid
    end
    it 'name is present' do
      expense.name = 'Beef Burger'
      expect(expense).to be_valid
    end
    it 'amount should be greater than 0.0' do
      expense.amount = -150.50
      expect(expense).to_not be_valid
    end
    it 'amount is greater than 0.0' do
      expense.amount = 75.55
      expect(expense).to be_valid
    end
  end
end
