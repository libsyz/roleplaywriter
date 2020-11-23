# == Schema Information
#
# Table name: competencies
#
#  id                  :bigint           not null, primary key
#  name                :string
#  competency_model_id :bigint           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Competency < ApplicationRecord
  belongs_to :competency_model
  has_many :behavioral_markers, dependent: :destroy
end
