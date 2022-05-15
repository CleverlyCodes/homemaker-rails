class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])
        @ingredients = Ingredient.all
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)

        unless @recipe.save
            render :new, status: :unprocessable_entity
        end

        redirect_back_or_to :back
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy

        redirect_to root_path, status: :see_other
    end

    private
        def recipe_params
            params.require(:recipe).permit(:name, :description)
        end
end