class Api::V1::MembersController < Api::V1::Controller

  def index
    @members = current_user.group.users
  end

end