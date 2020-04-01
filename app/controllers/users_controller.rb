class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  # current_user.updateに成功した場合、rootにリダイレクトし、失敗した場合、editのビューを再度描画する

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end