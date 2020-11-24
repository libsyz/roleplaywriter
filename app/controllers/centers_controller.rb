class CentersController < ApplicationController
  def new
    @center = Center.new
  end

  def create
    @center = Center.new(center_params)
    if @center.save
      redirect_to new_center_matrix_path(@center)
    else
      flash[:notice] = 'something went wrong'
      render :new
    end
  end


  private


  def center_params
    values = params.require(:center).permit(:storyline, :competency_model)
    {
      storyline: Storyline.find(values[:storyline]),
      competency_model: CompetencyModel.find(values[:competency_model])
     }
  end
end
