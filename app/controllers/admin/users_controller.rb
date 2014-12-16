class Admin::UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	layout 'admin'

	def index
		@users = User.all.page(params[:page])
	end

	def show
	end

	def new
		@user = User.new
	end

	def edit
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to admin_users_url, notice: 'User was successfully created.'
		else
			render :new
		end
	end

	def update
		if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
			params[:user].delete(:password)
			params[:user].delete(:password_confirmation)
		end

		if @user.update(user_params)
			redirect_to admin_users_url, notice: 'User was successfully updated.'
		else
			render :edit
		end
	end

	def destroy
		@user.destroy
		redirect_to admin_users_url, notice: 'User was successfully destroyed.'
	end

	private
	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
	end
end
