require 'rails_helper'

RSpec.describe 'Users', type: :system do
  # rubocop:disable Metrics/BlockLength
  context 'sign up page' do
    before(:each) do
      driven_by(:rack_test)

      visit new_user_registration_path
    end

    it 'should display welcoming message' do
      expect(page).to have_content('Register')
    end

    it 'should display all fields' do
      find_field('Email')
      find_field('Full name')
      find_field('Password')
      find_field('Password confirmation')
      find_button('Sign up')
    end

    it 'should display errors if all fields are blank' do
      click_button('Sign up')

      expect(page).to have_content(
        '3 errors prohibited this user from being saved:'
      )
    end

    it 'should display error if password is less than 6 characters' do
      fill_in('Email', with: 'teklegy@gmail.com')
      fill_in('Full name', with: 'Tekle Gebreyohannes')
      fill_in('Password', with: '12345')
      fill_in('Password confirmation', with: '12345')

      click_button('Sign up')

      expect(page).to have_content(
        'Password is too short (minimum is 6 characters)'
      )
    end

    it 'should display error if password doesn\'t match password confirmation' do
      fill_in('Email', with: 'teklegy@gmail.com')
      fill_in('Full name', with: 'Tekle Gebreyohannes')
      fill_in('Password', with: '123456')
      fill_in('Password confirmation', with: 'not_the_same')

      click_button('Sign up')

      expect(page).to have_content(
        "Password confirmation doesn't match Password"
      )
    end
  end
  # rubocop:enable Metrics/BlockLength
end