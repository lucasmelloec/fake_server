FactoryBot.define do
  factory :response do
    body { 'MyString' }
    type { '' }
    code { 1 }
    expectation { nil }
  end
end
