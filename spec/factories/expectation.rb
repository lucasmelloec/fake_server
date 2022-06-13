FactoryBot.define do
  factory :expectation do
    method { 'GET' }
    path { 'MyString' }
    url_param { '' }
    domain { nil }
  end
end
