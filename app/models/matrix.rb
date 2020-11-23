class Matrix < ApplicationRecord
  belongs_to :center
  has_many :exercise_slots
end
