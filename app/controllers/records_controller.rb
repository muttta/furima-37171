class RecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_payment = UserPayment.new
  end
  def create
    @item = Item.find(params[:item_id])
    @user_payment = UserPayment.new(record_params)
    if @user_payment.valid?
      @user_payment.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  private
  def record_params
    params.require(:user_payment).permit(:postal_code, :shipment_source_id, :city, :address, :building, :phone). 
    merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
