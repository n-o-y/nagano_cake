class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).joins(:genre)
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @genres = Genre.all
    if @item.save
      redirect_to "/admin/items/#{@item.id}"
    else
      render :new
    end
  end

  def show
    @item = Item.joins(:genre).find(params[:id])
    @tax = 1.1
  end

  def edit
    @item = Item.joins(:genre).find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.joins(:genre).find(params[:id])
    @genres = Genre.all
    if @item.update(item_params)
      redirect_to "/admin/items/#{@item.id}"
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
  end

end
