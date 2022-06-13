# == Schema Information
#
# Table name: responses
#
#  id             :integer          not null, primary key
#  body           :string           not null
#  code           :integer          not null
#  format         :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  expectation_id :integer          not null
#
# Indexes
#
#  index_responses_on_expectation_id  (expectation_id)
#
# Foreign Keys
#
#  expectation_id  (expectation_id => expectations.id)
#
class ResponseSerializer
  include JSONAPI::Serializer
  attributes :body, :format, :code
end
