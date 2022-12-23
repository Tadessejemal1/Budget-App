require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  Category.delete_all
  Expense.delete_all
  User.delete_all
  let(:user) { FactoryBot.create(:user, :confirmed) }
  let(:category) { FactoryBot.create(:category, author: user) }

  describe 'GET /categories' do
    before :example do
      sign_in user

      get categories_path
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

      get new_category_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render add new category view' do
      expect(response).to render_template(:new)
    end
  end
end
