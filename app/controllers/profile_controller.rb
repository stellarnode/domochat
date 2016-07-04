class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @user = current_user
    @profile = @user.profile.update(permit_profile)
    redirect_to profile_path
  end


  private

    def permit_profile
      params.require(:profile).permit(:first_name, :last_name, :middle_name, :phone, :avatar)
    end

end
