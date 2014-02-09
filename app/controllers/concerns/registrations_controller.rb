class RegistrationsController < Devise::RegistrationsController

  def create
    super
    # build_resource(sign_up_params)
    Friendship.create(user_id: resource.id, friend_id: resource.id)
  end

end 