class SearchesController < ApplicationController
  def new
  end

  def index
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: :ture)
  end
end
