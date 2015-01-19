require 'open-uri'
require 'uri'

class TickersController < ApplicationController
  def index
    $sp_data = open(URI.encode("http://download.finance.yahoo.com/d/quotes.csv?s=^GSPC&f=l1,c")).read.split(",")
    $nasdaq_data = open(URI.encode("http://download.finance.yahoo.com/d/quotes.csv?s=^IXIC&f=l1,c")).read.split(",")
    @tickers = Ticker.search(params[:q]).order("symbol DESC")
  end
  def show
    @ticker = Ticker.find(params[:id])
    @comment = Comment.new
    @comments = @ticker.comments.order("created_at ASC").page(params[:page]).per(25)
  end
end
