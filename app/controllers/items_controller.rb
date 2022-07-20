class ItemsController < ApplicationController
  def index
    @items = Item.all().order(expired_by: :asc)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_back_or_to :back
  end
end