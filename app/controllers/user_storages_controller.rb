class UserStoragesController < ApplicationController
  def index
    if current_user.my_image.nil?
      @my_image = current_user.build_my_image
    else
      @my_image = current_user.my_image
    end
    @categories = Category.all
    @user_storages = current_user.user_storages.all.includes(:user)
    @user_storage = current_user.user_storages.new
  end

  def create
    # if user_storage_params[:category_id].blank? == false && user_storage_params[:name].blank? == false
    @user_storage = current_user.user_storages.new(user_storage_params)
    if @user_storage.save
      #例外をキャッチ
      redirect_to user_storages_path, success: '保存に成功しました'
    else
      redirect_to user_storages_path, danger: '保存に失敗しました'
    end
  end

  def destroy
    UserStorage.find_by(id: params[:id]).destroy
    redirect_to user_storages_path, info: '削除しました'
  end

  private
  def user_storage_params
    params.require(:user_storage).permit(:category_id, :name)
  end
end
