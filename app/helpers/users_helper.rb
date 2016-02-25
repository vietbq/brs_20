module UsersHelper

  def get_activity_trackable_content activity
    trackable_type = activity.trackable_type
    @trackable = Settings.activity.trackable[trackable_type.downcase].content
  end

  def gravatar_for user, option = {size: Settings.avatar.size}
    gravatar_id = Digest::MD5::hexdigest user.email.downcase
    size = option[:size]
    gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag gravatar_url, alt: user.username, class: "gravatar"
  end
end
