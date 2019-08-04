class SearchesController < ApplicationController
  def new
    params[:q]= :nil
    @q = Recipe.ransack(title_cont_any: params[:q])
    @recipes = @q.result(distinct: :true)
  end

  def index
    params[:q][:title_cont] = params[:q][:title_cont].split(/[\p{blank}\s]+/)
    @q = Recipe.ransack(title_cont_any: params[:q][:title_cont])
    @recipes = @q.result(distinct: :true)
    @rakuten = search_rakuten_api("a")
  end

  def search_rakuten_api(keyword)

  RakutenWebService.configure do |c|
    c.application_id = '1200002403'
    c.affiliate_id = '1200002403'
  end
  items = RakutenWebService::Ichiba::Item.search(keyword: keyword)
  images_arr = []
    items.each do |item|

    # したい処理
    puts item['itemName'] #商品名
    puts item['itemPrice'] #価格
    puts item['itemUrl'] #商品のURL

    end
  end
end
