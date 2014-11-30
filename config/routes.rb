Reactions::Application.routes.draw do

  devise_for :users, controllers: { sessions: "sessions", passwords: "passwords" }

	get 'admin', to: 'welcome#admin'

	namespace :admin do
		resources :users
		resources :reviews
	end

	resource :reviews, only: [:new, :create]

	devise_scope :user do
		root to: "sessions#new"
	end
end
