class ItemsController < ApplicationController
before_action :authenticate_user!, except: [:index]
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
    def show
      @item = Item.find(params[:id])
    end
  end

  private
  def item_params
    params.require(:item).
    permit(:item_name, :item_price, :description, :category_id, :status_id, :delivery_period_id, :delivery_fee_id, :shipment_source_id, :image).
    merge(user_id: current_user.id)
  end

end 
