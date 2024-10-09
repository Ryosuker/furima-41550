class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :shipping_area_id, :city, :street_line, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id
    )
  end

  def move_to_index
    return if Item.find(params[:id]).user == current_user

    redirect_to root_path
  end
end
