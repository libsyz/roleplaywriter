class Competency < ApplicationRecord
  belongs_to :competency_model
  has_many :behavioral_markers, dependent: :destroy
end
