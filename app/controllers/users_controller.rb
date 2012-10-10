class UsersController < Clearance::UsersController
  def new
    if User.all.length < 1
      super
    end
  end

  def create
    if User.all.length < 1
      super
    end
  end

  def show
    
  end

end
