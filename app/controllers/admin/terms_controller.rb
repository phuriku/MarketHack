class Admin::TermsController < ApplicationController
  before_action :check_admin

  def check_admin
    if !current_user.admin
      redirect_to root_path, notice: "The URL you just attempted to access is for website administrators only."
    end
  end

  def index
    @terms = Term.order(name: :asc)
  end

  def edit
    @term = Term.find(params[:id])
  end

  def destroy
    @term = Term.find(params[:id])
    if @term.destroy
      redirect_to admin_terms_path, notice: "Page successfully deleted."
    end
  end

  def new
    @term = Term.new
  end
end
