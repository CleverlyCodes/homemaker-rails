class NeedsController < ApplicationController
  def index
    @needs = Need.all
  end

  def show
    @need = Need.find(params[:id])
  end

  def new
    @need = Need.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    unless @ingredient.save
      render :new, status: :unprocessable_entity
    end

    redirect_back_or_to :back
  end

  private
    def ingredient_params
        params.require(:ingredient).permit(:name, :description)
    end
end