module Reachable
  extend ActiveSupport::Concern

  included do
    validates :path,
      presence: true,
      format: { with: %r{/?([a-zA-Z0-9._~%-]+/?)+},
                message: 'can have only allowed characters' }
  end
end
