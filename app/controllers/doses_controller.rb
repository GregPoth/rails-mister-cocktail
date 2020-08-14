class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.create(dose_params)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy

    @dose = Dose.find(params[:id])
    redirect_to cocktail_path(@dose.cocktail)
    @dose.destroy

  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id )
  end
end
