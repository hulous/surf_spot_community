class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def new
    @spot = Spot.new
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def create
    @spot = Spot.new(spot_params)

    if @spot.save
      redirect_to(spot_url(@spot), notice: I18n.t("spot.create.success"))
      return
    end

    render(:new, status: :unprocessable_entity)
  end

  def update
    @spot = Spot.find(params[:id])

    if @spot.update(spot_params)
      redirect_to(spot_url(@spot), notice: I18n.t("spot.update.success"))
      return
    end

    render(:edit, status: :unprocessable_entity)
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy

    redirect_to(spots_url, notice: I18n.t("spot.destroy.success"))
  rescue ActiveRecord::InvalidForeignKey
    redirect_to(spots_url, error: I18n.t("spot.destroy.failure"))
  end

  private

  def spot_params
    params.require(:spot).permit(permitted_params)
  end

  def permitted_params
    @permitted_params ||= %i[description name longitude latitude difficulty wave_size best_season]
  end
end
