module AvatarHelper
  def avatar_icon(user, options = { :size => 100})
    gravatar_image_tag(user.email, :class => "thumb #{options[:class]}", :alt => user.name , :gravatar => { :size => options[:size] ,  :default => :wavatar })
  end

  def render_user_avatar(user)
    avatar_icon(user, :class => "media-object dp img-circle", :size => 80)
  end
end
