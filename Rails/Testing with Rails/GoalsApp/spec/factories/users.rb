FactoryBot.define do
  factory :user do
    email { "test-username" }
    # password_digest { BCrypt::Password.create("testpass") }
    password { "test-password" }
    activated { true }

    factory :user_with_goals do
      # transient do
      #   goals_count 10
      # end

      after(:create) do |user, evaluator|
        create_list(:random_goal, 10, user: user)
      end
    end

  end

  factory :random_user, class: User do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    activated { true }

    factory :random_user_with_goals do
      # transient do
      #   goals_count 10
      # end

      after(:create) do |user, evaluator|
        create_list(:random_goal, 10, user: user)
      end
    end
  end
end
