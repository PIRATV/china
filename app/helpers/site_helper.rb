module SiteHelper
  def current_user? user
    user == current_user
  end
  def user_status_image user
    image_tag image_path("user_#{user.online? ? 'on' : 'off'}line.gif")
  end
  def check_active_page action
    action.downcase!
    return ' class=active' if action_name.downcase == action or request.fullpath =~ /\b#{action}\b/ or URI.decode_www_form_component(request.fullpath) =~ /\b#{action}\b/
    nil
  end
end
