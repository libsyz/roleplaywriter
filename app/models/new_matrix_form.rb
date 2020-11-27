
class NewMatrixForm
  include ActiveModel::Model

  attr_reader :ex_slots, :comps_per_exercise

  validate :slots_cannot_have_the_same_exercise
  validate :competencies_cannot_be_repeated_in_an_exercise


  def initialize(ex_slots=4, comps_per_exercise=4)
    @ex_slots = ex_slots
    @comps_per_exercise = comps_per_exercise
    create_ex_slots_and_competencies
    super()
  end

  def build_from(form_params)
    form_params.each_pair do |key, value|
      if key.to_s.match?(/exercise_slot_/) && self.respond_to?("#{key}".to_sym)
        self.instance_variable_set("@#{key}".to_sym, value)
      elsif value.is_a? ActionController::Parameters
        comp_group = value
        comp_group.each_pair do |key, value|
           self.instance_variable_set("@#{key}".to_sym, value)
        end
      end
    end
    # add the right form values to the right ex_slots and competencies.
    # this method couples the view to the form
  end

  def save
    return false if invalid?
    # TODO
    # Actually build freaking records
    # Create a matrix!
    matrix = Matrix.create(center: Center.find(params[:id]))
    self.exercise_slots.each do |ex_id|
      exercise = ExerciseSlot.create(matrix: matrix)
      self.competencies_for_ex(ex_id).each do |comp_id|
        CompetencySlot.create(exercise_slot: exercise)
      end
    end

  def exercise_slots
  end

  def competencies_for_ex(ex_number)

  end

  def slots_cannot_have_the_same_exercise
    errors.add(:ex_slots, "exercises cannot be repeated" ) if ex_slot_values != ex_slot_values.uniq
    errors.add(:ex_slots, "you must select at least one exercise" ) if ex_slot_values.empty?
  end

  private

  def create_ex_slots_and_competencies
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


  def competencies_cannot_be_repeated_in_an_exercise
    @ex_slots.times do |n|
      comps_in_exercise = []
      @comps_per_exercise.times do |i|
        comps_in_exercise << instance_variable_get("@ex_slot_#{n + 1}_comp_#{i + 1}")
      end

      case
      when comps_in_exercise.compact.empty?
        errors.add("ex_slot_#{n + 1}".to_sym, "You must select at least one competency for this exercise")
      when comps_in_exercise != comps_in_exercise.uniq && comps_in_exercise.length > 1
        errors.add("ex_slot_#{n + 1}".to_sym, "competencies cannot be repeated in the same exercise")
      end
    end
  end

end

