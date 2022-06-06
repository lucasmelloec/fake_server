class Response < ApplicationRecord
  belongs_to :expectation

  VALID_FORMATS = ['json']
  private_constant :VALID_FORMATS

  validates :format, presence: true, inclusion: { in: VALID_FORMATS }
  validates :body, presence: true
  validates :code, presence: true
end
