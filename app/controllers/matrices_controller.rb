class MatricesController < ApplicationController
  def new
    center = Center.find(params[:center_id])
    @matrix = Matrix.new
    @exercises = center.storyline.exercises
    @competencies = center.competency_model.competencies
  end

  def create
  end
end
