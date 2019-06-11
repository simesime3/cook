class MyImagesController < ApplicationController
  def new
    @my_image = MyImage.new
  end

  def index
    @my_image = current_user.my_image
  end

  # 更新の時はupdateに行くように
  def create
    my_image = MyImage.find_by(user_id: current_user.id)
    if my_image
      my_image = MyImage.update(image: selffot_params[:image])
      if my_image
        #updateが完了したら一覧ページへリダイレクト
        redirect_to my_pages_path, success: '上書きに成功しました'
      else
        #updateを失敗すると編集ページへ
        flash.now[:danger] = "上書きに失敗しました"
        redirect_to my_pages_path
      end
    else
      my_image = MyImage.create(user_id: current_user.id, image: selffot_params[:image])
      if my_image
        redirect_to my_pages_path, success: '保存に成功しました'
      else
        flash.now[:danger] = "保存に失敗しました"
        redirect_to my_pages_path
      end
    end
  end

  def update
     @my_image_image = MyImage.find_by(user_id: :current_user.id)
     @my_image.image = @my_image_image.image
     if @my_image.update
       #updateが完了したら一覧ページへリダイレクト
       redirect_to 'my_pages/new', success: '保存に成功しました'
     else
       #updateを失敗すると編集ページへ
       flash.now[:danger] = "保存に失敗しました"
       render 'my_pages/new'
     end
   end


  private
  def selffot_params
    params.require(:my_image).permit(:image)
  end
end
