class SearchController < ApplicationController
  def items
    @items = Search.items_search(params[:search])
  end
end
