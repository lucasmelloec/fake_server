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
require 'rails_helper'

RSpec.describe Response, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
