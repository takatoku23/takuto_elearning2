module UsersHelper
  def gravatar_for(user,class_name)
    #Generate hex taken
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url,alt:user.name,class:class_name)
  end
end
