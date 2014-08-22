module MyAccountsHelper
  # count no of day update password
  def count_password_day
    u = User.where(:id => current_user.id).first
    from_date = u.update_password_date.to_date
    to_date = Time.now.to_date
    ct = (to_date-from_date).to_i
    return ct
  end
end
