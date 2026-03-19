class Dashboard::AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address, only: %i[ show edit update destroy ]
  layout 'dashboard'

  def index
    @addresses = current_user.addresses.order(created_at: :desc)
  end

  def show
  end

  def new
    @address = current_user.addresses.build
  end

  def edit
  end

  def create
    @address = current_user.addresses.build(address_params)

    if @address.save
      redirect_to dashboard_addresses_path, notice: "地址已成功添加。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @address.update(address_params)
      redirect_to dashboard_addresses_path, notice: "地址已成功更新。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @address.destroy
    redirect_to dashboard_addresses_path, notice: "地址已成功删除。", status: :see_other
  end

  private

  def set_address
    @address = current_user.addresses.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:country, :province, :city, :district, :detail_address, :contact_name, :phone, :alt_phone, :email)
  end
end
