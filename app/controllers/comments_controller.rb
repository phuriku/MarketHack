class CommentsController < ApplicationController
  def new
    @ticker = Ticker.find(params[:ticker_id])
    @comment = Comment.new
  end
  def create
    @ticker = Ticker.find(params[:ticker_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.ticker_id = @ticker.id
    @comment.stock_price = @ticker.price

    if @comment.save
      redirect_to ticker_path(@ticker), notice: "Comment successfully posted!"
    else
      render @ticker
    end
  end

  def comment_params
    params.require(:comment).permit(:ticker_id, :user_id, :description, :stock_price)
  end
end
