class GymDataController < ApplicationController
	def index
		@gym_data = GymData.new
	end
end