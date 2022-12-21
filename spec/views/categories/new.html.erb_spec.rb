require 'rails_helper'

RSpec.describe 'Categories', type: :system do
  before :all do
    driven_by(:rack_test)
  end

  # rubocop:disable Metrics/BlockLength
  context 'add new category page' do
    before :each do
      visit '/users/sign_in'

      within('#new_user') do
        fill_in 'Email', with: 'adam@domain.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
    end

    it 'should render add new category view' do
      find("[id='add_new_category']").click

      expect(page).to have_field('Category name')
      expect(page).to have_field('Icon url')
      expect(page).to have_selector('input[name="commit"]')
    end

    it 'should create new category with valid inputs' do
      find("[id='add_new_category']").click

      fill_in 'Category name', with: 'Transportation'
      fill_in 'Icon url', with: 'icon-url'
      find('input[name="commit"]').click

      expect(current_path).to eq categories_path
      expect(page).to have_content('Transportation')
      expect(page).to_not have_field('Category name')
    end

    it 'should display error messages on empty name and icon' do
      find("[id='add_new_category']").click

      expect(page).to have_field('Category name')
      expect(page).to have_field('Icon url')

      fill_in 'Category name', with: ''
      fill_in 'Icon url', with: ''

      find('input[name="commit"]').click
      expect(page).to have_field('Category name')
      expect(page).to have_field('Icon url')
    end
  end
  # rubocop:enable Metrics/BlockLength
end