
class Storyline < ApplicationRecord
  has_many :centers
  has_many :exercises, dependent: :destroy
end
