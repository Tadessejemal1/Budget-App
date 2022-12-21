require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  Category.delete_all
  Expense.delete_all
  User.delete_all
  let(:user) { FactoryBot.create(:user, :confirmed) }
  let(:expense) { FactoryBot.create(:expense, author: user) }
  let(:category) { FactoryBot.create(:category, author: user) }

  describe 'GET /categories/{category_id}/expenses' do
    before :example do
      sign_in user

      get category_expenses_path(category_id: category.id)
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

      get new_expense_path, params: { prev_category_id: category.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render ' do
      expect(response).to render_template(:new)
    end
  end

  describe 'GET /categories/{category_id}/expenses/{id}' do
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
