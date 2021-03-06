class Word < ActiveRecord::Base
  attr_accessible :entry
  has_and_belongs_to_many :meanings
  has_many :searches

  def to_param
    "#{name}"
  end
end
