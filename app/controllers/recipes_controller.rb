class RecipesController < ApplicationController

  def index
    r = Recipe.find(:last)
    if r then redirect_to recipe_path r end
  end

  def show
    @recipes = Recipe.find(:all)
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    render :action => "edit"
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.save
    redirect_to :action => "index"
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if(@recipe.update_attributes(params[:recipe]))
      redirect_to @recipe
    else
      render :action => 'edit' 
    end
  end

  def destroy
    Recipe.destroy params[:id]
    redirect_to :action => 'index'
  end
end
