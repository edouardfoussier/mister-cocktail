class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :crop]

  def index
    @cocktails = Cocktail.all
  end

  def show
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

  def edit
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
    # if @cocktail.update
    #   redirect_to cocktail_path(@cocktail)
    # else
    #   render :back
    # end
  end

  def crop
    @x = @cocktail.x
    @y = @cocktail.y
  end

  private
  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :photo_cache, :x, :y)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end


#link_to("Delete, cocktail_dose_path(@cocktail, dose), method: :delete")
