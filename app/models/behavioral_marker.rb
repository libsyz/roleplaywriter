# == Schema Information
#
# Table name: behavioral_markers
#
#  id            :bigint           not null, primary key
#  marker        :string
#  competency_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class BehavioralMarker < ApplicationRecord
  belongs_to :competency
end
