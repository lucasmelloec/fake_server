class ExpectationSerializer
  include JSONAPI::Serializer
  attributes :path, :method, :url_param

  attributes :responses do |object|
    ResponseSerializer.new(object.responses)
  end
end
