class ExpectationSerializer
  include JSONAPI::Serializer
  attributes :path, :method, :url_param
end
