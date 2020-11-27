class MatricesController < ApplicationController
  def new
    @center = Center.find(params[:center_id])
    @exercises = @center.storyline.exercises
    @competencies = @center.competency_model.competencies
    @matrix = NewMatrixForm.new
  end

  def create
    @new_matrix_form = NewMatrixForm.new
    @new_matrix_form.build_from(matrix_form_params)
    if @new_matrix_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def matrix_form_params
    binding.pry
    params.require(:matrix)
  end
end
