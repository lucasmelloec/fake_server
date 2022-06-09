class DomainSerializer
  include JSONAPI::Serializer
  attributes :name, :path

  attributes :expectations do |object|
    ExpectationSerializer.new(object.expectations)
  end
end
