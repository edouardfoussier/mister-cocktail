class DosesController < ApplicationController
  before_action :set_cocktail, except: [:destroy]

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    # @dose = Dose.new(dose_params)
    # @dose.cocktail = @cocktail
    @dose = @cocktail.doses.new(dose_params) #ça crée une nouvelle dose avec le paramètre Cocktail_id renseigné.
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    # @cocktail = @dose.cocktail
    @dose.destroy
    # redirect_to cocktail_path(@cocktail)
    redirect_to :back
  end

  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:cocktail_id, :ingredient_id, :description)
  end
end
