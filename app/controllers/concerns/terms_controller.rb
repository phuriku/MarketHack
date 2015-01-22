class TermsController < ApplicationController
  def index
    @terms = Term.order(name: :asc)
  end

  def update
    @term = Term.find(params[:id])
    if @term.update(term_params)
      redirect_to admin_terms_path
    end
  end

  def create
    @term = Term.new(term_params)
    if @term.save
      redirect_to admin_terms_path
      flash[:notice] = "Page successfully added."
    end
  end

  def term_params
    params.require(:term).permit(:name, :definition, :example)
  end
end
