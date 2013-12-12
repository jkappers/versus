class UsersController < ApplicationController
  before_filter :get_user, only: [:profile, :show]
  load_and_authorize_resource only: :destroy

  def show

  end

  def profile
    unless @user.id == current_user.id
      authorize! :view_profile, @user
    end
  end

  private

  def get_user
    @user = User.find(params[:id])
  end
end
