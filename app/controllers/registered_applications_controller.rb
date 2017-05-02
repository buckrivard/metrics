class RegisteredApplicationsController < ApplicationController
  def index
    @reg_apps = current_user.registered_applications
    @users = User.all
  end

  def new
    @reg_app = RegisteredApplication.new
  end

  def create
    @reg_app = current_user.registered_applications.new(app_params)
    @reg_app.save
    redirect_to @reg_app
  end

  def show
    @reg_app = RegisteredApplication.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @reg_app = RegisteredApplication.find(params[:id])
    @reg_app.destroy
    redirect_to registered_applications_path
  end

  private

  def app_params
    params.require(:registered_application).permit(:name, :url)
  end
end
