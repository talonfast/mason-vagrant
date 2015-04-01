class HopController < ApplicationController
	def read
		render json: Hop.last
	end
end
