class Question < ApplicationRecord
  belongs_to :user
  has_many :options
  has_many :reviews
  accepts_nested_attributes_for :options, :reviews,
                                :allow_destroy => true,
                                :reject_if     => :all_blank
  enum status: [:pending, :approved, :rejected]
end
