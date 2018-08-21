Rails.application.routes.draw do
  resources :doors_events
  post '/doors_state/toggle', to: 'doors_state#toggle'
end
