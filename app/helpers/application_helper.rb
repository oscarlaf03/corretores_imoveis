module ApplicationHelper

  def owner?
    user_signed_in? && current_user.site_owner
  end
end
