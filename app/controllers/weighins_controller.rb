class WeighinsController < ApplicationController
	def index
		@weighins = Weighin.all

		render json: @weighins
	end

	def create
		@weighin = Weighin.new(weighin_params)

		if @weighin.save
			render json: @weighin, status: 201
		else
			render json: @weighin.errors.first.join(' ').capitalize, status: 422
		end
	end	

	def show
		@weighin = Weighin.find(params[:id])

		if @weighin.present?
			render json: @weighin
		else
			render json: { error: "Couldn't find weighin" }
		end
	end

	protected

	def weighin_params
		params.require(:weighin).permit(:weight, :date)
	end
end
