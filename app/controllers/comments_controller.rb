class CommentsController < ApplicationController

  def check_admin_or_author(author)
    if !current_user.admin and current_user != author
      redirect_to root_path, notice: "You must be the post author or an admin to access this page."
    end
  end

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
      redirect_to ticker_path(@ticker), notice: "Comment successfully posted."
    else
      render @ticker
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @ticker = @comment.ticker
    @author = User.find(@comment.user_id)
    check_admin_or_author(@author)
  end

  def update
    @comment = Comment.find(params[:id])
    @ticker = @comment.ticker
    if @comment.update(comment_params)
      redirect_to ticker_path(@ticker), notice: "Comment successfully edited."
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @ticker = @comment.ticker
    if @comment.destroy
      redirect_to ticker_path(@ticker), notice: "Comment deleted."
    end
  end

  def comment_params
    params.require(:comment).permit(:ticker_id, :user_id, :description, :stock_price)
  end
end
