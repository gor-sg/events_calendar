class ProfileController < ApplicationController
  skip_before_action :require_login, only: :show

  def show
    @user ||= User.find(doorkeeper_token.resource_owner_id)

    render "users/show.json.jbuilder"
  end
end
