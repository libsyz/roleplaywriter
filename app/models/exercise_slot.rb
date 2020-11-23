class ExerciseSlot < ApplicationRecord
  belongs_to :matrix
  has_many :competency_slots
end
