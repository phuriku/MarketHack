class Admin::TickersController < ApplicationController
  before_action :check_admin

  def check_admin
    if !current_user.admin
      redirect_to root_path, notice: "The URL you just attempted to access is for website administrators only."
    end
  end

  def index
    @tickers = Ticker.order(name: :asc)
  end

  def edit
    @ticker = Ticker.find(params[:id])
  end
end
