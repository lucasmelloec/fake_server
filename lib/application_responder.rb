class ApplicationResponder < ActionController::Responder
  include Responders::HttpCacheResponder

  # Redirects resources to the collection path (index action) instead
  # of the resource path (show action) for POST/PUT/DELETE requests.
  # include Responders::CollectionResponder

  def handle_json(options = {})
    status = post? ? :created : :ok
    serializer = "#{resource.model_name}Serializer".classify
    render json: serializer.constantize.new(resource, options).serializable_hash, status:
  end

  def to_format
    if default_behavior?
      super
    else
      json_opts = {}
      json_opts[:include] = options[:include] if options.key?(:include)
      handle_json(json_opts)
    end
  end

  def default_behavior?
    return true if format != :json
    return true if has_errors?

    !(get? || post? || patch? || put?)
  end
end
