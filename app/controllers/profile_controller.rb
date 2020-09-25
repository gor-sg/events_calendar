class ProfileController < ApplicationController
  before_action :set_user

  def show
    render "users/show"
  end

  def edit
    render "users/edit"
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to '/me', notice: 'User was successfully updated.' }
      else
        format.html { render 'users/edit' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end
end
