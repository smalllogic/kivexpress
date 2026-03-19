class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.all.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@order), notice: '订单状态已更新。'
    else
      render :show, alert: '更新失败。'
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
