class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :item_id
  def index
      user_redirect
    @user_payment = UserPayment.new
  end
  def create
      user_redirect
    @user_payment = UserPayment.new(record_params)
    if @user_payment.valid?
      pay_item
      @user_payment.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def record_params
    params.require(:user_payment).permit(:postal_code, :shipment_source_id, :city, :address, :building, :phone). 
    merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,
      card:   record_params[:token],
      currency: 'jpy'
    )
  end
  def user_redirect
    if (@item.record.present?) || (current_user.id == @item.user_id)
      redirect_to root_path
    end
  end
  def item_id
    @item = Item.find(params[:item_id])
  end

end
