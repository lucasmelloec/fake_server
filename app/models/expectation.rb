# == Schema Information
#
# Table name: expectations
#
#  id         :integer          not null, primary key
#  method     :string           not null
#  path       :string           not null
#  url_param  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  domain_id  :integer          not null
#
# Indexes
#
#  index_expectations_on_domain_id                         (domain_id)
#  index_expectations_on_path_and_url_param_and_domain_id  (path,url_param,domain_id) UNIQUE
#
# Foreign Keys
#
#  domain_id  (domain_id => domains.id)
#
class Expectation < ApplicationRecord
  include Reachable

  belongs_to :domain

  has_many :responses, dependent: :destroy

  VALID_METHODS = ['GET', 'POST', 'PUT', 'PATCH', 'DELETE'].freeze
  public_constant :VALID_METHODS

  validates :path, uniqueness: { scope: [:domain_id, :url_param] }
  validates :method, presence: true, inclusion: { in: VALID_METHODS }

  def full_path
    return path if url_param.blank?

    "#{path}/:#{url_param}"
  end
end
