class UsersController < Clearance::UsersController
  def new
    if User.all.size < 1
      super
    else
      redirect_to root_url
    end
  end

  def create
    if User.all.size < 1
      super
      redirect_to root_url
    end
  end

end
