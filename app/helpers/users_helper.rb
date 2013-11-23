module UsersHelper
  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def is_admin?
    if @user.admin == true
      true
    else
      false
    end
  end

  def has_notifications?
    if Commitment.where("(active_user_id = ? OR overseer_user_id = ?)
                         AND active_user_id IS NOT NULL
                         AND overseer_user_id IS NOT NULL
                         AND creator_id != ?
                         AND status = ?", @user.id, @user.id, @user.id, "Pending").any?
      true
    else
      false
    end
  end

end
