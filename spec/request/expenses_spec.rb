require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  User.delete_all
  let(:user) { FactoryBot.create(:user, :confirmed) }
  let(:expense) { FactoryBot.create(:expense, author: user) }

  describe 'GET /expenses' do
    before :example do
      sign_in user

      get expenses_path
    end

    after :example do
      sign_out user
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render index view' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /expenses/new' do
    before :example do
      sign_in user

      get new_expense_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render ' do
      expect(response).to render_template(:new)
    end
  end

  describe 'GET /expenses/{id}' do
    before :example do
      sign_in user

      get expense_path(expense.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render expense show view' do
      expect(response).to render_template(:show)
    end
  end
end
