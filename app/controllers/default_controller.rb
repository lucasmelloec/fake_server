class DefaultController < ApplicationController
  class MissingPath < StandardError; end

  rescue_from MissingPath, with: :missing_path

  def all
    raise MissingPath
  end

  def missing_path
    render json: { message: 'missing path' }, status: :ok
  end
end
