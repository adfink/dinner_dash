class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.all
    # @orders = Order.group(:status).order("status desc").count(:status)
  end

  def update
    order = Order.find_by(id: params[:id])
    order.update_attributes(status: params[:status])
    redirect_to :back
  end
end
