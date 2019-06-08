class TitlesController < ApplicationController
  def index
    @contents = current_user.contents.all
  end

  def new
    @content = current_user.contents.new
    @foods = @content.foods.new(content_id: @content.id)
  end

  def create
    # binding.pry
    @content = Content.new(content_params)
    # logger = Rails.logger
    # logger.debug current_user.id
    @content.user_id = current_user.id
    if @content.save
      redirect_to '/titles', success: '投稿に成功しました'
    else

      flash.now[:danger] = "投稿に失敗しました"
      render :action => "new"
    end
  end

  private
  def content_params
    params.require(:content).permit(:title, :image)
  end
end
