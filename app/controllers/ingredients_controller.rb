class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
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
        params.require(:ingredient).permit(:recipe, :ingredient)
    end
end