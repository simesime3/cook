class MyImagesController < ApplicationController
  # 更新の時はupdateに行くように
  def create
    if my_image_params
     @my_image = current_user.build_my_image(image: my_image_params[:image])
     @my_image.save
     redirect_to user_storages_path, success: '保存に成功しました'
    else
     redirect_to user_storages_path, danger: "保存に失敗しました"
    end
  end

  def update
    if my_image_params == false
      redirect_to user_storages_path, danger: "更新に失敗しました"
    else
     @my_image = current_user.my_image.update(my_image_params)
       redirect_to user_storages_path, success: '更新に成功しました'
    end
  end

  private
    def my_image_params
      params.require(:my_image).permit(:image)
    end
end
