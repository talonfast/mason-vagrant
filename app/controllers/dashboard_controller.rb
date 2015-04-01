class DashboardController < ApplicationController
	def index
		@error = Hop.last[:up]
	end
end
