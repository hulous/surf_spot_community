class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(show_user_parameters)
  end

  private

  def show_user_parameters
    params.require(:id)
  end
end
