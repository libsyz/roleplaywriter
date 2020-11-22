
class CompetencyModel < ApplicationRecord
  has_many :centers
  has_many :competencies, dependent: :destroy

end
