class Api::V1::UsersController < Api::V1::Controller

  def register_device_token
    current_user.device_token = params[:device_token]
    if current_user.save
      render json: { success: true }
    else  
      render json: { success: false, errors: current_user.errors.full_messages}, status: 422
    end
    
  end

end