class ImagesController < ApplicationController

  def new
    @selffot = Selffot.new
  end

  def index
    @selffot = current_user.selffot
  end

  # 更新の時はupdateに行くように
  def create
    selffot = Selffot.find_by(user_id: current_user.id)
    if selffot
      selffot = Selffot.update(image: selffot_params[:image])
      if selffot
        #updateが完了したら一覧ページへリダイレクト
        redirect_to storages_path, success: '上書きに成功しました'
      else
        #updateを失敗すると編集ページへ
        flash.now[:danger] = "上書きに失敗しました"
        redirect_to storages_path
      end
    else
      selffot = Selffot.create(user_id: current_user.id, image: selffot_params[:image])
      if selffot
        redirect_to storages_path, success: '保存に成功しました'
      else
        flash.now[:danger] = "保存に失敗しました"
        redirect_to storages_path
      end
    end
  end

  def update
     @selffot_image = Selffot.find_by(user_id: :current_user.id)
     @selffot.image = @selffot_image.image
     if @selffot.update
       #updateが完了したら一覧ページへリダイレクト
       redirect_to 'storages/new', success: '保存に成功しました'
     else
       #updateを失敗すると編集ページへ
       flash.now[:danger] = "保存に失敗しました"
       render 'storages/new'
     end
   end


  private
  def selffot_params
    params.require(:selffot).permit(:image)
  end
end
