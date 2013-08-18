# Let's define our factories
FactoryGirl.define do
  
  # Define a factory to generate a test user
  factory :user do |f|
    # To avoid duplicate names, we can generate names in a numerical sequence
    f.sequence(:name) { |n| "test#{n}" }
    # Set the user's email to the sequenced name we just generated
    f.email { |u| "#{u.name}@test.com" }

    # Define a related factory, relative to the user we just generated
    factory :user_with_tweets do
      after(:create) do |u, evaluator|
        # Generate a random number of tweets (from 10-499) using the tweet factory and assigned to a user
        # Demonstration of generating related model data
        FactoryGirl.create_list(:tweet, Random.rand(10...500), user: u)
      end
    end
  end


  # Define a factory to generate a fake tweet
  factory :tweet do
    # Use the Faker gem to generate a sentence of Lorem ipsum for field post
    post Faker::Lorem.sentence
    # Related to the user model
    user
  end

end
