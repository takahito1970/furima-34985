class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:user, :product_name, :description)
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
