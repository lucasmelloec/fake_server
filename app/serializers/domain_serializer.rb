# == Schema Information
#
# Table name: domains
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  path       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_domains_on_path  (path) UNIQUE
#
class DomainSerializer
  include JSONAPI::Serializer
  attributes :name, :path

  attributes :expectations do |object|
    ExpectationSerializer.new(object.expectations)
  end
end
