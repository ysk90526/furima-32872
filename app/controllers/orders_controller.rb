class OrdersController < ApplicationController
  def index
  end

  def create
  end

  private

  def order_params
    params.require(:shipping_address).permit(:postcode, :area_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id)
end
