class UserHome

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def tweets
    seguidores = user.seguindo.ids << user.id
    Tweet.por_usuarios(seguidores).order("created_at desc")
  end

  def followers
    user.seguidores
  end

  def following

  end

end