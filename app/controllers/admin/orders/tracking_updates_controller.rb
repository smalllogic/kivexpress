class Admin::Orders::TrackingUpdatesController < Admin::BaseController
  before_action :set_order

  def create
    @tracking_update = @order.tracking_updates.build(tracking_update_params)
    if @tracking_update.save
      redirect_to admin_order_path(@order), notice: '物流进度已添加。'
    else
      redirect_to admin_order_path(@order), alert: '添加失败：' + @tracking_update.errors.full_messages.join(", ")
    end
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def tracking_update_params
    params.require(:tracking_update).permit(:status_description, :location)
  end
end
