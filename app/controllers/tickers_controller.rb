require 'open-uri'
require 'uri'

class TickersController < ApplicationController
  def index
    $sp_data = open(URI.encode("http://download.finance.yahoo.com/d/quotes.csv?s=^GSPC&f=l1,c")).read.split(",")
    $nasdaq_data = open(URI.encode("http://download.finance.yahoo.com/d/quotes.csv?s=^IXIC&f=l1,c")).read.split(",")
    @tickers = Ticker.search(params[:q]).order("symbol DESC")
    @nasdaq_price = $nasdaq_data[0].to_f.round(1)
    @nasdaq_change = $nasdaq_data[2].split(" - ")[1].to_f
    @sp_price = $sp_data[0].to_f.round(1)
    @sp_change = $sp_data[2].split(" - ")[1].to_f
  end

  def show
    @ticker = Ticker.find(params[:id])
    @comment = Comment.new
    @comments = @ticker.comments.order("created_at ASC").page(params[:page]).per(25)
  end

  def update
    @ticker = Ticker.find(params[:id])
    if @ticker.update(ticker_params)
      redirect_to ticker_path(@ticker), notice: "Ticker successfully edited."
    end
  end

  def ticker_params
    params.require(:ticker).permit(:symbol, :name, :market_cap, :pe, :peb)
  end
end
