class UsersController < BaseController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(update_params)

    redirect_to users_path(@user)
  end

  private
  def update_params
    params.require(@user.type.downcase.to_sym).permit(:avatar)
  end
end
