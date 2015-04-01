Rails.application.routes.draw do
	get '/' => 'dashboard#index'
	get 'api/update' => 'update#create'
	get 'api/read' => 'update#read'
	get 'hop/read' => 'hop#read'
end
