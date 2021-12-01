class ItemsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    item_id
  end

  def edit
    item_id
    redirect_root_path
  end

  def update
    item_id
    redirect_root_path
    if @item.update(item_params)
     redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).
    permit(:item_name, :item_price, :description, :category_id, :status_id, :delivery_period_id, :delivery_fee_id, :shipment_source_id, :image).
    merge(user_id: current_user.id)
  end

  def item_id
    @item = Item.find(params[:id]) 
  end

  def redirect_root_path
    if (@item.record.present?) || (current_user.id != @item.user_id)
      redirect_to root_path
    end
  end

end