class MatricesController < ApplicationController
  def new
    @center = Center.find(params[:center_id])
    @new_matrix_form = NewMatrixForm.new
    @exercises = @center.storyline.exercises
    @competencies = @center.competency_model.competencies
  end

  def create
    @new_matrix_form = NewMatrixForm.new(matrix_form_params)

    if @new_matrix_form.save
      redirect_to some_path
    else
      render :new
    end
  end

  def matrix_form_params
    binding.pry
    params.require
  end
end
