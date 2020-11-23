# == Schema Information
#
# Table name: exercises
#
#  id           :bigint           not null, primary key
#  name         :string
#  storyline_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Exercise < ApplicationRecord
  belongs_to :storyline
end
