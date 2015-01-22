class Admin::PagesController < ApplicationController
  before_action :check_admin

  def check_admin
    if !current_user.admin
      redirect_to root_path, notice: "The URL you just attempted to access is for website administrators only."
    end
  end

  def index
    @pages = Page.order(title: :asc)
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    if @page.destroy
      redirect_to admin_pages_path, notice: "Page successfully deleted."
    end
  end

  def page_params
    params.require(:page).permit(:title, :description)
  end

end
