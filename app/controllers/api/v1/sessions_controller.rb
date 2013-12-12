class Api::V1::SessionsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:create ]
  skip_before_filter :verify_authenticity_token
  include Devise::Controllers::Helpers
  
  before_filter :ensure_params_exist
 
  respond_to :json
  
  def create
    resource = User.find_for_database_authentication(:email=>params[:email])
    return invalid_login_attempt unless resource
 
    if resource.valid_password?(params[:password])
      sign_in("user", resource)
      render :json=> {:success=>true, :auth_token=>resource.token, :email=>resource.email}
      return
    end
    invalid_login_attempt
  end
  
  def destroy
    sign_out(resource_name)
  end
 
  protected
  def ensure_params_exist
    return unless params[:email].blank?
    render :json=>{:success=>false, :message=>"missing email parameter"}, :status=>422
  end
 
  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end
end