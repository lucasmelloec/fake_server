# == Schema Information
#
# Table name: expectations
#
#  id         :integer          not null, primary key
#  method     :string           not null
#  path       :string           not null
#  url_param  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  domain_id  :integer          not null
#
# Indexes
#
#  index_expectations_on_domain_id                         (domain_id)
#  index_expectations_on_path_and_url_param_and_domain_id  (path,url_param,domain_id) UNIQUE
#
# Foreign Keys
#
#  domain_id  (domain_id => domains.id)
#
class ExpectationSerializer
  include JSONAPI::Serializer
  attributes :path, :method, :url_param

  attributes :responses do |object|
    ResponseSerializer.new(object.responses)
  end
end
