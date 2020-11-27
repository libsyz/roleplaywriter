
class NewMatrixForm
  include ActiveModel::Model

  validate :slots_cannot_have_the_same_exercise
  #validate :competencies_cannot_be_repeated_in_an_exercise

  def initialize(ex_number=4)
    @ex_slots = ex_number
    generate_slots
    super()
  end

  def slots_cannot_have_the_same_exercise
    errors.add(:ex_slots, "exercises cannot be repeated" ) if ex_slot_values != ex_slot_values.uniq
    errors.add(:ex_slots, "you must select at least one exercise" ) if ex_slot_values.empty?
  end

  def save
    return false if invalid?

    Matrix.new()
  end

  private

  def generate_slots
    @ex_slots.times do |n|
      singleton_class.class_eval { attr_accessor "exercise_slot_#{n + 1}" }
    end
  end

  def ex_slot_values
    instance_variables.select { |attr| attr.match?(/@exercise_slot_/ )}
                                       .map { |var| self.instance_variable_get(var) }
  end

end

