class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
  @user = User.new(user_params)
  if @user.save
    redirect_to root_path, success: "登録しました"
  else
    flash.now[:danger] = "もう一度やり直しました"
    render  :new
  end
end
private #クラス内部でしか利用できないようにする
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation) #userメソッドをrequireで呼び出し、nameとemailのパラメータのみを許可
  end
end
