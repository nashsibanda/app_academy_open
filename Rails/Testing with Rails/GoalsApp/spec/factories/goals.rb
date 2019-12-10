FactoryBot.define do
  factory :goal do
    association :user, factory: :random_user
    title { "Test Goal Title" }
    details { "This is the description of my test goal. Isn't it great?" }
    private { false }
    completed { false }
    deadline { "2020-12-10" }
  end
end
