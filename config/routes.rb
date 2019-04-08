Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	jsonapi_resources :elements
	jsonapi_resources :pages do
		get :read_page
	end
end
