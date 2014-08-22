class UsersController < ApplicationController
  def edit_password
    @user = current_user
    render :layout => false
  end
  
  # update password of current user
  def update_password
    @user = User.find(current_user.id)
    if @user.update_attributes(user_params)
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to my_accounts_path, :notice => 'Password successfully updated.'
    else
      render :action => "edit_password"
    end
  end

  private
  
  # handling params for update password
  def user_params
    # NOTE: Using `strong_parameters` gem
    params.required(:user).permit(:password, :password_confirmation, :update_password_date)
  end
end
