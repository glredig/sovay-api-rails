FactoryBot.define do
	factory :weighin do
		weight { Faker::Commerce.price(range = 100.0..225.0) }
		date { Faker::Date.backward(30) }
	end
end