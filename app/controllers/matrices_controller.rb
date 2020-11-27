class MatricesController < ApplicationController
  def new
    @center = Center.find(params[:center_id])
    @exercises = @center.storyline.exercises
    @competencies = @center.competency_model.competencies
    @new_matrix_form = NewMatrixForm.new(1,2)
  end

  def create
    @new_matrix_form = NewMatrixForm.new(1,2)
    @new_matrix_form.build_from(matrix_form_params)
    if @new_matrix_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def matrix_form_params
    params.require(:new_matrix_form).permit!
  end
end
