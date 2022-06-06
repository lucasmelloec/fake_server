class Expectation < ApplicationRecord
  include Reachable

  belongs_to :domain

  has_many :responses, dependent: :destroy

  VALID_METHODS = ['GET', 'POST', 'PUT', 'PATCH', 'DELETE']
  private_constant :VALID_METHODS

  validates :path, uniqueness: { scope: [:domain_id, :url_param] }
  validates :method, presence: true, inclusion: { in: VALID_METHODS }

  def path=(new_path)
    self[:path] = "/#{new_path.delete_prefix("/").chomp("/")}"
  end

  def full_path
    return path if url_param.blank?

    "#{path}/:#{url_param}"
  end
end
