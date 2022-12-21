require 'rails_helper'

RSpec.describe 'Expenses', type: :system do
  before :all do
    driven_by(:rack_test)
  end

  context 'add new expense page' do
    before :each do
      visit '/users/sign_in'

      within('#new_user') do
        fill_in 'Email', with: 'adam@domain.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
    end

    it 'should render add new expense view' do
      visit categories_path
      expect(page).to have_content('Categories')
      category = Category.first
      id = "category_show#{category.id}"
      expect(page).to have_selector(:css, "a##{id}")
      find("[id=#{id}]").click

      expect(current_path).to eq category_expenses_path(category)
      expect(page).to have_selector(:css, 'a#add_new_expense')
      find("[id='add_new_expense']").click

      expect(page).to have_field('Expense name')
      expect(page).to have_field('Amount')
      expect(page).to have_selector('input[name="commit"]')
    end

    it 'should create new expense with valid inputs' do
      visit categories_path
      expect(page).to have_content('Categories')
      category = Category.first
      id = "category_show#{category.id}"
      expect(page).to have_selector(:css, "a##{id}")
      find("[id=#{id}]").click

      expect(current_path).to eq category_expenses_path(category)
      expect(page).to have_selector(:css, 'a#add_new_expense')
      find("[id='add_new_expense']").click

      fill_in 'Expense name', with: 'Scrumpled Eggs'
      fill_in 'Amount', with: 50.05
      find('#category_category_id').find(:xpath, 'option[1]').select_option
      find('input[name="commit"]').click

      expect(page).to_not have_field('Category name')
    end

    it 'should display error messages on empty name, amount, and categories' do
      visit categories_path
      expect(page).to have_content('Categories')
      category = Category.first
      id = "category_show#{category.id}"
      expect(page).to have_selector(:css, "a##{id}")
      find("[id=#{id}]").click

      expect(current_path).to eq category_expenses_path(category)
      expect(page).to have_selector(:css, 'a#add_new_expense')
    end
  end
end
