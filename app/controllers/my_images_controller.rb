class MyImagesController < ApplicationController
  # 更新の時はupdateに行くように
  def create
    if params[:my_image].nil?
      redirect_to my_pages_path,danger: "保存に失敗しました"
    else
     @my_image = current_user.build_my_image(my_image_params)
     @my_image.save
     redirect_to my_pages_path, success: '保存に成功しました'
    end
  end

  def update
    if params[:my_image].nil?
      redirect_to my_pages_path,danger: "保存に失敗しました"
    else
     @my_image = current_user.my_image.update(my_image_params)
       redirect_to my_pages_path, success: '保存に成功しました'
    end
  end

  private
    def my_image_params
      params.require(:my_image).permit(:image)
    end
end
