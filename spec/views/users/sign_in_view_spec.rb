require 'rails_helper'

RSpec.describe 'LoginPages', type: :system do
  Category.delete_all
  Expense.delete_all
  User.delete_all
  let(:user) { FactoryBot.create(:user, :confirmed) }

  before(:all) do
    driven_by(:rack_test)
  end

  before :example do
    visit '/users/sign_in'
  end

  it 'renders sign in page' do
    expect(page).to have_field('user_email')
    expect(page).to have_field('user_password')
    expect(page).to have_button('Log in')
  end

  it 'Error: Invalid Email or password with empty email and password' do
    within('#new_user') do
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'Error: Invalid Email or password with wrong password' do
    within('#new_user') do
      fill_in 'Email', with: 'adam@domain.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'Error: Invalid Email or password with wrong email' do
    within('#new_user') do
      fill_in 'Email', with: 'eve@domain.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'signs me in with valid email and password' do
    within('#new_user') do
      fill_in 'Email', with: 'adam@mail.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Sign up Forgot your password'
  end
end