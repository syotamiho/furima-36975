class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def update
    @item = Item.find(params[:id])
      if @item.update(item_params)
        redirect_to item_path(params[:id])
      else
        render :edit
      end
  end
  
  private

  def item_params
    params.require(:item).permit(:title, :category_id, :situation_id, :postage_id, :city_id, :shipping_date_id, :explanation, :price, :image).merge(user_id: current_user.id)
  end
end
