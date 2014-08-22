class RegistrationsController < Devise::RegistrationsController
	layout :false
  
  # update current user information on my accounts 
  def update
    @user = User.find(current_user.id)
    #successfully_updated = if needs_password?(@user, params)
    #  @user.update_with_password(params[:user])
    #else
      # remove the virtual current_password attribute update_without_password
     # params[:user].delete(:current_password)
    #end
    if @user.update_attributes(params[:user])
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to my_accounts_path, notice: "Hurrey!Your Info update successfully."
    else
      render "edit"
    end
  end

  private

  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(user, params)
    user.email != params[:user][:email] ||
      params[:user][:password].present?
  end

end
