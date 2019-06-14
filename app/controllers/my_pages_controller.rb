class MyPagesController < ApplicationController
  def index
    # @my_page = MyPage.new
    if current_user.my_image.nil?
      @my_image = current_user.build_my_image
    else
      @my_image = current_user.my_image
    end
    # @my_page = MyPage.new(user_id: current_user.id)
    # @my_page = current_user.build_my_page
    @categories = Category.all
    @materials = current_user.materials.all.includes(:user)
    @material = current_user.materials.new
  end

  def create
    @material = current_user.materials.new(my_page_params)
    if @material.save!
      redirect_to my_pages_path, success: '保存に成功しました'
    else
      redirect_to my_pages_path, danger: '保存に失敗しました'
    end
  end

  def destroy
    Material.find_by(id: params[:id]).destroy
    redirect_to my_pages_path, info: '削除しました'
  end

  private
  def my_page_params
    params.require(:material).permit(:category_id, :name)
  end
end
