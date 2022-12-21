require 'rails_helper'

RSpec.describe 'Expenses', type: :system do
  before :all do
    Category.delete_all
    User.delete_all
    driven_by(:rack_test)

    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'Email', with: 'adam@domain.com'
      fill_in 'Full name', with: 'Adam'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'
    end
    user = User.first
    user.confirm

    category = Category.new(name: 'Foods and Drinks',
                            icon: 'category-icon',
                            author: user)
    expense = Expense.new(name: 'Omlet',
                          amount: 30.5,
                          author: user)
    category_expense = ExpenseCategory.new(category_id: category.id,
                                           expense_id: expense.id)
    category.save
    expense.save
    category_expense.save
  end

  context 'list view' do
    before :each do
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'Email', with: 'adam@domain.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
    end
  end
end