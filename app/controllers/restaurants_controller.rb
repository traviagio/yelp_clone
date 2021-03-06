class RestaurantsController < ApplicationController

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new params[:restaurant].permit(:name, :description)
		
		if @restaurant.save
			redirect_to restaurants_path
		else
		   render 'new'
		end
	end

	def index
		@restaurants = Restaurant.all
	end

	def edit
		@restaurant = Restaurant.find params[:id]
	end

	def update
		@restaurant = Restaurant.find params[:id]
		@restaurant.update params[:restaurant].permit(:name, :description)
		redirect_to '/restaurants'
	end

	def show
		@restaurant = Restaurant.find params[:id]
	end

	def destroy
		@restaurant = Restaurant.find params[:id]
		@restaurant.delete
		redirect_to '/restaurants'
	end
end
