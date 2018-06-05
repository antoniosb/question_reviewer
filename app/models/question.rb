class Question < ApplicationRecord
  belongs_to :user
  has_many :options
  has_many :reviews
  accepts_nested_attributes_for :options, :reviews,
                                :allow_destroy => true,
                                :reject_if     => :all_blank
  validates_presence_of :content, :source, :year
  enum status: [:pending, :approved, :rejected]


  validate :atleast_one_option_is_checked

  def atleast_one_option_is_checked
    errors.add(:base, 'Selecione uma alternativa correta.') if
        self.options.all?{ |option| option.answer.blank? }
  end
end
