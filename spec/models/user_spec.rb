# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  Category.delete_all
  Expense.delete_all
  User.delete_all
  let(:user) { FactoryBot.create(:user, :confirmed) }

  describe 'validate data' do
    it 'name should be present' do
      user.name = ''
      expect(user).to_not be_valid
    end

    it 'name should be present' do
      user.name = 'Abebe'
      expect(user).to be_valid
    end
  end
end