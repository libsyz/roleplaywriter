# == Schema Information
#
# Table name: competency_models
#
#  id   :bigint           not null, primary key
#  name :string
#
class CompetencyModel < ApplicationRecord
  has_many :centers
  has_many :competencies, dependent: :destroy

end
