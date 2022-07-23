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
    print "!!!"
    print params[:need][:ingredient]
    print params[:need][:recipe]

    @ingredient = Ingredient.find(params[:need][:ingredient])
    @recipe = Recipe.find(params[:need][:recipe])

    @need = Need.new(
      :recipe => @recipe,
      :ingredient => @ingredient,
    )

    unless @need.save
      render :new, status: :unprocessable_entity
    end

    redirect_back_or_to :back
  end

  private
    def ingredient_params
        params.require(:ingredient).permit(:recipe, :ingredient)
    end
end