class Domain < ApplicationRecord
  include Reachable

  has_many :expectations, dependent: :destroy

  validates :name, presence: true
  validates :path, uniqueness: true
end
