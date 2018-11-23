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

	def update
		@weighin = Weighin.find(params[:id])

		if @weighin.update_attributes(weighin_params)
			render json: @weighin, status: 201
		else
			render json: @weighin.errors.first.join(' ').capitalize, status: 422
		end
	end

	def destroy
		@weighin = Weighin.find(params[:id])

		if @weighin.destroy
			render status: 204
		else
			render json: @weighin.errors.first.join(' ').capitalize, status: 404
		end
	end
	
	protected

	def weighin_params
		params.require(:weighin).permit(:weight, :date)
	end
end
