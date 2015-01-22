class TermsController < ApplicationController
  def show
    @term = Term.find(params[:id])
  end

  def create
    @term = Term.new(term_params)
    if @term.save
      redirect_to term_path(@term), notice: "Term successfully added."
    end
  end

  def update
    @term = Term.find(params[:id])
    if @term.update(term_params)
      redirect_to term_path(@term), notice: "Term successfully edited."
    end
  end

  def term_params
    params.require(:term).permit(:name, :definition, :example)
  end
end
