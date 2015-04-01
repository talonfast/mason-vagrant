class UpdateController < ApplicationController
	def create
		client_id = 'xxxx-xxxx-xxxx-xxxx'
		if request.headers['M-Applicationid'] != 'connectedaquaponicsclient-v1.1'
			render plain: 'Invalid Client'
		elsif request.headers['M-Clientid'] != client_id
			render plain: 'Invalid Client ID'
		else
			update = Update.new
			update.water_level = params[:wl]
			update.water_temp = params[:wt]
			update.air_temp = params[:at]
			update.humidity = params[:h]
			update.save
			render plain: 'Omega Good Job!'
		end
	end

	def read
		update = Update.last

    array = {'water_level' => update.water_level,
             'water_temp' => update.water_temp,
             'air_temp' => update.air_temp,
             'humidity' => update.humidity,
             'time' => update.created_at.to_f * 1000,
             'up' => Hop.last.up}
		render json: array
	end
end