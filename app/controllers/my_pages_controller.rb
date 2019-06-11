class MyPagesController < ApplicationController
  def index
    # @my_page = MyPage.new
    @my_image = MyImage.new
    @my_page = MyPage.new(user_id: current_user.id)
    @categories = Category.all
    @material = Material.new
  end

  def create
    # @my_page = current_user.my_pages.new(my_page_params)
    @my_page.category_id = params[:category_id]
    @material = Material.create(name: params[:material_id])
    @my_page.material_id = @material.id

    if @my_page.save!
      redirect_to my_pages_path, success: '保存に成功しました'
    else
      redirect_to my_pages_path, danger: '保存に失敗しました'
    end
  end

  def destroy
    MyPage.find_by(id: params[:id]).destroy
    redirect_to my_pages_path, info: '削除しました'
  end

  private
  def my_page_params
    params.require(:my_page).permit(:material_id)
  end
end
