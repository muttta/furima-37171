class ItemsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :redirect_root_path, only: [:show, :edit, :update]
before_action :set_item, only: [:edit, :update]
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
  end

  def edit
  end

  def update
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
  def redirect_root_path
    set_item
    if (@item.record.present?) || (current_user.id != @item.user_id)
      redirect_to root_path
    end
  end
  def set_item
    @item = Item.find(params[:id]) 
  end

end