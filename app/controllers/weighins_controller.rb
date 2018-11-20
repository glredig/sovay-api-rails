class WeighinsController < ApplicationController
	def index
		@weighins = Weighin.all

		render json: @weighins
	end
end
