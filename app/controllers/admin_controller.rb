class AdminController < ApplicationController
  def index
    if !current_user.admin
      redirect_to root_path, notice: "The URL you just attempted to access is for website administrators only."
    end
  end
end
