Reactions::Application.routes.draw do

	get 'admin', to: 'welcome#admin'
	namespace :admin do
		resource :users
		resource :reviews
	end
	resource :reviews, only: [:new, :create]
	root 'welcome#index'
end
