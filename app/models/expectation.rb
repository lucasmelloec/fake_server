class Expectation < ApplicationRecord
  include Reachable

  belongs_to :domain

  validates :path, uniqueness: { scope: :domain_id }

  def path=(new_path)
    self[:path] = "/#{new_path.delete_prefix("/").chomp("/")}"
  end

  def full_path
    return path if url_param.blank?

    "#{path}/:#{url_param}"
  end
end
