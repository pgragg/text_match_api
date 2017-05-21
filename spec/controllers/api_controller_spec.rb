require 'spec_helper'
RSpec.describe ApiController, type: :controller do
require 'rspec/core/rake_task'

  describe 'GET #load_data' do

    it 'returns http 500 without a valid key' do
      response = get '/api/v1/load_data'
      expect(response.status).to eq(500)
    end

    it 'returns http 200 with a valid key' do
      response = get '/api/v1/load_data?api_key=testing_access_key'
      expect(response.status).to eq(200)
    end

  end
end
