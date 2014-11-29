Reactions::Application.routes.draw do

  devise_for :users

	get 'admin', to: 'welcome#admin'

	namespace :admin do
		resource :users
		resource :reviews
	end

	resource :reviews, only: [:new, :create]

	devise_scope :user do
		root to: "sessions#new"
	end
end
