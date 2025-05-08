class ItemsController < ApplicationController
  def index
    @index = Index.all
  end
end
