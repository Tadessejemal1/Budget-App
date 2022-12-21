require 'rails_helper'

RSpec.describe 'Splashes', type: :request do
  describe 'GET /' do
    before :example do
      get root_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render splash screen' do
      expect(response).to render_template(:index)
    end
  end
end
