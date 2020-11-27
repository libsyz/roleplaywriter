
class NewMatrixForm
  include ActiveModel::Model

  validate :slots_cannot_have_the_same_exercise
  validate :competencies_cannot_be_repeated_in_an_exercise

  def initialize(ex_number=4, comps_per_exercise=4)
    @ex_slots = ex_number
    @comps_per_exercise = comps_per_exercise
    generate_slots_and_competencies
    super()
  end

  def slots_cannot_have_the_same_exercise
    errors.add(:ex_slots, "exercises cannot be repeated" ) if ex_slot_values != ex_slot_values.uniq
    errors.add(:ex_slots, "you must select at least one exercise" ) if ex_slot_values.empty?
  end

  def competencies_cannot_be_repeated_in_an_exercise
    # loop through the number of exercise names
    @ex_slots.times do |n|
      arr = []
      @comps_per_exercise.times do |i|
        arr << instance_variable_get("@ex_slot_#{n + 1}_comp_#{i + 1}")
      end

      case
      when arr.compact.empty?
        errors.add("ex_slot_#{n + 1}".to_sym, "You must select at least one competency for this exercise")
      when arr != arr.uniq && arr.length > 1
        errors.add("ex_slot_#{n + 1}".to_sym, "competencies cannot be repeated in the same exercise")
      end

    end
  end

  def save
    return false if invalid?

    Matrix.new()
  end

  private

  def generate_slots_and_competencies
    @ex_slots.times do |n|
      singleton_class.class_eval { attr_accessor "exercise_slot_#{n + 1}" }
      @comps_per_exercise.times do |i|
        singleton_class.class_eval { attr_accessor "ex_slot_#{n + 1}_comp_#{i + 1}" }
      end
    end
  end

  def ex_slot_values
    instance_variables.select { |attr| attr.match?(/@exercise_slot_/ )}
                                       .map { |var| self.instance_variable_get(var) }
  end
end

