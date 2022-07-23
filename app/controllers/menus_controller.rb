class MenusController < ApplicationController
    def index
        @menus = Menu.all
    end

    def show
        @menu = Menu.find(params[:id])
        @recipes = Recipe.all
    end

    def destroy
        @menu = Menu.find(params[:id])
        @menu.destroy

        redirect_to root_path, status: :see_other
    end

    def create
        @menu = Menu.new(menu_params)

        unless @menu.save
            render :new, status: :unprocessable_entity
        end

        redirect_back_or_to :back
    end

    private
        def menu_params
            params.require(:menu).permit(:name, :description)
        end
end