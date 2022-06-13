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
require 'rails_helper'

RSpec.describe Domain, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
