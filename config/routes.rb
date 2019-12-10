Rails.application.routes.draw do
  root "home#index"
  post 'generate_short_url', to: "home#generate_short_url"
  get 'stats', to: "home#stats"
  get '/:short_url', to: "home#short_url"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
