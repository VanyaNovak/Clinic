class UsersController < HomeController
  def show
    @user = User.find(current_user.id)
  end
end
