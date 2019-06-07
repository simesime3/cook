class TitlesController < ApplicationController
  def index
    @contents = Content.all.includes(:current_user)
  end

  def new
    @content = current_user.contents.new
  end

  def create
    # binding.pry
    @content = Content.new(content_params)
    if @content.save
      redirect_to '/titles', success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      # binding.pry
      redirect_to new_title_path
    end
  end





  private
  def content_params
    params.permit(:title, :image)
  end
end
