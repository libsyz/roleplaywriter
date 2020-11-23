# == Schema Information
#
# Table name: storylines
#
#  id   :bigint           not null, primary key
#  name :string
#
class Storyline < ApplicationRecord
  has_many :centers
  has_many :exercises, dependent: :destroy
end
