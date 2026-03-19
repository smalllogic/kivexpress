class TrackingController < ApplicationController
  def show
    @tracking_number = params[:tracking_number] || params[:q]
    if @tracking_number.present?
      # 假设订单 ID 就是物流单号，或者可以根据业务逻辑生成更复杂的单号
      # 目前简单起见直接用 ID 查找
      @order = Order.find_by(id: @tracking_number)
      if @order
        @tracking_updates = @order.tracking_updates.order(created_at: :desc)
      else
        flash.now[:alert] = "未找到该单号，请核对后重试。"
      end
    end
  end
end
