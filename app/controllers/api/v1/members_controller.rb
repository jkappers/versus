class Api::V1::MembersController < Api::V1::Controller
  def index
    @members = current_user.group.users
  end

  def suggest
    @member = User.find(current_user.opponents.pluck(:id).sample)
  end
end
