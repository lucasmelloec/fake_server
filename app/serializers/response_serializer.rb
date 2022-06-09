class ResponseSerializer
  include JSONAPI::Serializer
  attributes :body, :format, :code
end
