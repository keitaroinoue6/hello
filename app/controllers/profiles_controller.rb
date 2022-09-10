class ProfilesController < ApplicationController
  def show
  end

  def edit
  end

  def update
    user = current_user
    # params[:user] => {name: "bob", email: "bob@example.com"}
    user.update(user_params)
  end

  private
  # 外部から渡されたパラメーターをそのまま使用せずに
  # 明示的に許可したキーのみを利用する
  def user_params
    params.require(:user).permit(:name, :email)
  end
end