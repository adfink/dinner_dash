class Admin::OrdersController < Admin::BaseController
  before_action(:set_order, only: [:show, :update])

  def index
    @orders = Order.all
  end

  def show
  end

  def update
    @order.update_attributes(status: params[:status])
    redirect_to :back
  end

  private

  def set_order
    @order = Order.find_by(id: params[:id])
  end
end
