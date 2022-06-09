module Reachable
  extend ActiveSupport::Concern

  included do
    validates :path,
      presence: true,
      format: { with: %r{\A/?([a-zA-Z0-9._~%-]+/?)+\z},
                message: 'can have only allowed characters' }
  end

  def path=(new_path)
    return new_path if new_path.blank?

    self[:path] = "/#{new_path.delete_prefix("/").chomp("/")}"
  end
end
