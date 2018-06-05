class Review < ApplicationRecord
  belongs_to :question

  validates_presence_of :comment
end
