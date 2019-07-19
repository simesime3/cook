class SearchesController < ApplicationController
  def new
  end

  def index
    params[:q][:title_cont] = params[:q][:title_cont].split(/[\p{blank}\s]+/)
    @q = Recipe.ransack(title_cont_any: params[:q][:title_cont])
    @recipes = @q.result(distinct: :true)
  end
end
