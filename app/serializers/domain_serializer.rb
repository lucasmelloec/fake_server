class DomainSerializer
  include JSONAPI::Serializer
  attributes :name, :path
  has_many :expectations, options: { include: [:expectations] }
end
