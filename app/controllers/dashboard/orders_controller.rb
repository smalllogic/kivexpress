class Dashboard::OrdersController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def new
    @order = current_user.orders.build
    @addresses = current_user.addresses
  end

  def create
    @order = current_user.orders.build(order_params)
    
    # 获取发件人地址
    if params[:order][:selected_sender_id].present?
      address = current_user.addresses.find(params[:order][:selected_sender_id])
      @order.assign_attributes(extract_address_fields(address, 'sender'))
    end

    # 获取收件人地址
    if params[:order][:selected_receiver_id].present?
      address = current_user.addresses.find(params[:order][:selected_receiver_id])
      @order.assign_attributes(extract_address_fields(address, 'receiver'))
    end

    if @order.save
      redirect_to dashboard_orders_path, notice: "预订成功！"
    else
      @addresses = current_user.addresses
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:weight, :volume, :length, :width, :height)
  end

  def extract_address_fields(address, prefix)
    {
      "#{prefix}_name" => address.contact_name,
      "#{prefix}_phone" => address.phone,
      "#{prefix}_alt_phone" => address.alt_phone,
      "#{prefix}_email" => address.email,
      "#{prefix}_country" => address.country,
      "#{prefix}_province" => address.province,
      "#{prefix}_city" => address.city,
      "#{prefix}_district" => address.district,
      "#{prefix}_detail_address" => address.detail_address
    }
  end
end
