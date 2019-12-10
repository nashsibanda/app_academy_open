FactoryBot.define do
  factory :goal do
    association :user, factory: :random_user
    title { "Test Goal Title" }
    details { "This is the description of my test goal. Isn't it great?" }
    private { false }
    completed { false }
    deadline { "2020-12-10" }

    trait :deadline_passed do
      deadline { "2019-11-01" }
      to_create { |instance| instance.save(validate: false) }
    end
  end

  factory :random_goal, class: Goal do
    association :user, factory: :random_user
    title { Faker::Lorem.sentence }
    details { Faker::Lorem.paragraph }
    private { Faker::Boolean.boolean }
    completed { Faker::Boolean.boolean }
    deadline { Random.rand(2).even? ? Faker::Date.between(from: Date.today, to: 1.year.from_now) : nil }
  end
end
