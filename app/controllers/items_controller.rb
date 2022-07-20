class ItemsController < ApplicationController
  def index
    @items = Item.all().order(expired_by: :asc)
  end
end