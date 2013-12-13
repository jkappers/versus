class Api::V1::MembersController < Api::V1::Controller
  def index
    @members = current_user.group.users
  end

  def suggest
    @member = User.find(current_user.opponents.pluck(:id).sample)
  end

  def play
    @member = User.find(params[:id])
    if @member.device_token
      notification = {
        :schedule_for => [Time.now],
        :device_tokens => [@member.device_token],
        :aps => {:alert => "#{current_user.email} is ready to play you!", :badge => 1}
      }

      Urbanairship.push(notification)
      render status: 200, json: { success: true }
    else
      render status: 404, json: { success: false }
    end
  end
end
