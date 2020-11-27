
class NewMatrixForm
  include ActiveModel::Model

  validate :slots_cannot_have_the_same_exercise
  #validate :competencies_cannot_be_repeated_in_an_exercise

  def initialize(ex_number=4)
    @ex_number = ex_number
    @ex_number.times do |n|
      singleton_class.class_eval { attr_accessor "exercise_slot_#{n + 1}" }
    end
    super()
  end

  def slots_cannot_have_the_same_exercise
    # TODO: This does not work anymore, exercise slots are dynamically generated
    # get all the values that belong to instance props exercise_slot_n
    # throw them into an array
    # compare them
    # before I do this, I need to decide how do I want to model the data in the
    # exercises and the competencies

    ex_slot_values = instance_variables.select { |attr| attr.match?(/@exercise_slot_/ )}
                                       .map { |var| self.instance_variable_get(var) }

    errors.add(:ex_slots, "exercises cannot be repeated" ) if ex_slot_values != ex_slot_values.uniq
    errors.add(:ex_slots, "you must select at least one exercise" ) if ex_slot_values.empty?
  end

  def save
    Matrix.new()
  end

end

