class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new(cocktail: @cocktail)
    @doses = @cocktail.doses
    @ingredients = Ingredient.all.reject{|ingredient| @cocktail.ingredients.include?(ingredient)}
    # @ingredients = ["No more available ingredients"] if @ingredients == []
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private
  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
