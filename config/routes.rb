Rails.application.routes.draw do
  resources :doors_events
  post '/doors_state/toggle', to: 'doors_state#toggle'
  get '/doors_state/read', to: 'doors_state#read'
end
