class TickersController < ApplicationController
  def index
  end
  def show
    @ticker = Ticker.find(params[:id])
    @comment = Comment.new
    @comments = @ticker.comments.order("created_at DESC")
  end
end
