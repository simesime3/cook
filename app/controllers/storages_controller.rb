class StoragesController < ApplicationController

  def index
    @storage = Storage.new
    @selffot = Selffot.new
    @self = Selffot.find_by(user_id: current_user.id)
    @storages = current_user.storages.all
  end

  def create
    @storage = current_user.storages.new(storage_params)
    if @storage.save
      redirect_to storages_path, success: '保存に成功しました'
    else
      flash.now[:danger] = "保存に失敗しました"
      redirect_to storages_path
    end
  end

  def destroy
    @material.destroy
    redirect_to storages_path, info: '削除しました'
  end

  private
  def storage_params
    params.require(:storage).permit(:category, :material)
  end
  def storage_destroy

  end

end
