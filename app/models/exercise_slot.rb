class ExerciseSlot < ApplicationRecord
  has_many :competency_slots
  belongs_to :matrix
end
