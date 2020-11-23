# == Schema Information
#
# Table name: centers
#
#  id                  :bigint           not null, primary key
#  name                :string
#  competency_model_id :bigint           not null
#  storyline_id        :bigint           not null
#
class Center < ApplicationRecord
  belongs_to :competency_model
  belongs_to :storyline
  has_one :matrix
end
