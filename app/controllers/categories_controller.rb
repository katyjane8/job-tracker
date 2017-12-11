class CategoriesController < ApplicationController
  before_action :set_categories, only: [:show, :destroy, :edit, :update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_categories
  end 

end
