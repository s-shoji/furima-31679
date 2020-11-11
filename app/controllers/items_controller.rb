class ItemsController < ApplicationController
  # before_action :authenticate_user!, only: :new
  # def index
  #   @items = Item.all
  # end

  def new
    @item = Item.new
  end

  def create
  end
end
