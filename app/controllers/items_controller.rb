class ItemsController < ApplicationController
  def index
    @items = Item.all().order(expired_by: :asc)
  end

  def create
    print "!!!Create"

    @ingredient = Ingredient.find(params[:item][:ingredient])

    @bought_by = params[:item][:bought_by] ? params[:item][:bought_by] : DateTime.now
    @production_date = params[:item][:produced_by] ? params[:item][:produced_by] : DateTime.now

    @item = Item.new(
      :ingredient => @ingredient, 
      :quantity => params[:item][:quantity].to_i,
      :unit => params[:item][:unit],
      :expired_by => params[:item][:expired_by],
      :production_date => @production_date,
      :bought_by => @bought_by
    )

    unless @item.save
        render :new, status: :unprocessable_entity
    end

    redirect_back_or_to :back
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_back_or_to :back
  end

  private
    def item_params
        params.require(:item).permit(:ingredient, :quantity, :unit, :expired_by, :produced_by, :bought_by)
    end
end