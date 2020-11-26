
class NewMatrixForm
  include ActiveModel::Model

  validate :slots_cannot_have_the_same_exercise
  validate :competencies_cannot_be_repeated_in_an_exercise

  # attr_accessor :exercise_slot_1
  # attr_accessor :exercise_slot_2
  # attr_accessor :exercise_slot_3
  # attr_accessor :exercise_slot_4

  def initialize(ex_number=4)
    ex_number.times do |n|
      singleton_class.class_eval { attr_accessor "exercise_slot_#{n + 1}" }
    end
  end

  def slots_cannot_have_the_same_exercise
    slots = [exercise_slot_1, exercise_slot_2, exercise_slot_3, exercise_slot_4]
    errors.add(ex_slots: "exercises cannot be repeated" )if slots != slots.uniq
  end

  def save
    Matrix.new()
  end

end

