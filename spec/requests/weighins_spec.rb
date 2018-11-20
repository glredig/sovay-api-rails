require 'rails_helper'

RSpec.describe 'Weighins API', type: :request do
	let!(:weighins) { create_list(:weighin, 10) }
	let(:weighin_id) { weighins.first.id }

	describe 'GET /weighins' do
		before { get '/weighins' }

		it 'returns weighins' do
			expect(json).not_to be_empty
			expect(json.size).to eq(10)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end
end