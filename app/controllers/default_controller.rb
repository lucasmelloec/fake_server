class DefaultController < ApplicationController
  rescue_from MatchRoute::MissingResource, with: :missing_resource

  def all
    match_route = MatchRoute.new(all_params)

    render json: match_route.body, status: match_route.code
  end

  def missing_resource(resource_name)
    render json: { method: request.method, path: request.path, message: "missing #{resource_name}" }, status: :not_found
  end

  private

  def all_params
    { method: request.method, fullpath: request.path }
  end
end
