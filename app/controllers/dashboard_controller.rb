class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'

  def index
  end

  def my_packages
  end

  def warehouse
  end

  def profile
  end
end
