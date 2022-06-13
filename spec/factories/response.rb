FactoryBot.define do
  factory :response do
    body { 'MyString' }
    code { 1 }
    format { 'json' }
    expectation { nil }
  end
end
