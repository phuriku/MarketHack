class PagesController < ApplicationController
  def index
    @pages = Page.order(title: :asc)
  end

  def show
    @page = Page.find(params[:id])
    if @page.title == "Momentum Stocks"
      @tickers = Ticker.order(mov_avg_50_cmp: :desc).limit(10)
    elsif @page.title == "Active Stocks (by Volume)"
      @tickers = Ticker.order(volume_cmp: :desc).limit(10)
    elsif @page.title == "Active Stocks (by Price Change)"
      @tickers = Ticker.order(daily_change_abs: :desc).limit(10)
    elsif @page.title == "Value Stocks"
      @tickers = Ticker.order(pe_peb_avg: :asc).limit(10)
    elsif @page.title == "Volatile Stocks"
      @tickers = Ticker.where("daily_change_abs > ?", 1).order(daily_annual_change_avg: :desc).limit(10)
    elsif @page.title == "Small Cap Stocks"
      @tickers = Ticker.where("market_cap_num < ?", 5000000000).order(daily_change_abs: :desc).limit(10)
    elsif @page.title == "Tech Stocks"
      @tickers = Ticker.where("sector = ?", "Tech").order(daily_change: :desc).limit(10)
      @tickers_alt = Ticker.where("sector = ?", "Tech").order(daily_change: :asc).limit(10)
    elsif @page.title == "Finance Stocks"
      @tickers = Ticker.where("sector = ?", "Finance").order(daily_change: :desc).limit(10)
      @tickers_alt = Ticker.where("sector = ?", "Finance").order(daily_change: :asc).limit(10)
    elsif @page.title == "Energy Stocks"
      @tickers = Ticker.where("sector = ?", "Energy").order(daily_change: :desc).limit(10)
      @tickers_alt = Ticker.where("sector = ?", "Energy").order(daily_change: :asc).limit(10)
    end
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      redirect_to admin_pages_path
    end
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to admin_pages_path
      flash[:notice] = "Page successfully added."
    end
  end

  def page_params
    params.require(:page).permit(:title, :description, :advantages, :warnings)
  end
end
