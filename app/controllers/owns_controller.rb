class OwnsController < ApplicationController
  def new
    @own = Own.new
  end

  def create
    print "!!!"
    print params[:own][:menu]
    print params[:own][:recipe]

    @menu = Menu.find(params[:own][:menu])
    @recipe = Recipe.find(params[:own][:recipe])

    @own = Own.new(
      :recipe => @recipe,
      :menu => @menu,
    )

    unless @own.save
      render :new, status: :unprocessable_entity
    end

    redirect_back_or_to :back
  end

  def destroy
    @own = Own.find(params[:id])
    @own.destroy

    redirect_back_or_to :back
  end
end