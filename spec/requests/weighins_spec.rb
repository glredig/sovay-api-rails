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

	describe 'GET /weighins/:id' do
		before { get "/weighins/#{weighin_id}" }

		context 'when the record exists' do
			it 'returns the weighin' do
				expect(json).not_to be_empty
				expect(json['id']).to eq(weighin_id)
			end

			it 'returns status code 200' do
				expect(response).to have_http_status(200)
			end
		end

		context 'when the record does not exist' do
			let(:weighin_id) { 300 }

			it 'returns status code 404' do
				expect(response).to have_http_status(404)
			end

			it 'returns a not found message' do
				expect(response.body).to match(/Couldn't find Weighin/)
			end
		end
	end

	describe 'POST /weighins' do
		let(:valid_attrs) { { weighin: { weight: 180.2, date: 1.day.ago }} }

		context 'when the request is valid' do
			before { post '/weighins', params: valid_attrs }

			it 'creates a weighin' do
				expect(json['weight']).to eq('180.2')
			end

			it 'returns status code 201' do
				expect(response).to have_http_status(201)
			end
		end

		context 'when the request is invalid' do
			before { post '/weighins', params: { weighin: { weight: 200 } }}

			it 'returns status code 422' do
				expect(response).to have_http_status(422)
			end

			it 'returns a failure message' do
				expect(response.body).to match(/Date can't be blank/)
			end
		end
	end

	describe 'PUT /weighins/:id' do
		let(:valid_attrs) { { weighin: { weight: 200.0 }, id: weighin_id } }

		context 'when the request is valid' do
			before { put "/weighins/#{weighin_id}", params:  valid_attrs }

			it 'updates the weighin' do
				expect(json['weight']).to eq('200.0')
			end

			it 'returns status code 201' do
				expect(response).to have_http_status(201)
			end
		end

		context 'when the request is invalid' do
			before { put "/weighins/#{weighin_id}", params:  { weighin: { weight: 'a' } }}

			it 'returns status code 422' do
				expect(response).to have_http_status(422)
			end

			it 'returns a failure message' do
				expect(response.body).to match(/Weight is not a number/)
			end
		end
	end

	describe 'DELETE /weighins/:id' do
		context 'when the request is valid' do
			before { delete "/weighins/#{weighin_id}" }

			it 'returns status code 204' do
				expect(response).to have_http_status(204)
			end
		end

		context 'when the requested record is invalid' do
			before { delete "/weighins/300" }

			it 'returns status code 404' do
				expect(response).to have_http_status(404)
			end
		end
	end
end