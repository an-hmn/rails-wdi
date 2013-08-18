# Create the new namespace
namespace :twitter do


  # Using FactoryGirl, we want to generate a number of test users and tweets
  # This rake task accepts a parameter (user_count) to 
  desc "Create dummy Twitter posts and users"
  task :posts, [:user_count] => :environment do |t, args|
    # Using our defined factories in /test/factories.rb, generate tweets for a number of users (argument)
    FactoryGirl.create_list(:user_with_tweets, args[:user_count].to_i)
  end


  # Empty our User and Tweet tables -- a simple rake task using our rails app's models
  desc "Clear User and Tweet tables"
  task :clear => :environment do
    User.delete_all
    Tweet.delete_all
  end


  # Using the Twitter API and oauth params we can search Twitter and save our results to our database
  # Accepts 2 parameters: search query and number of desired results
  desc "Search Twitter for a query and number of results"
  task :search, [:query, :limit] => :environment do |t, args|

    limit = args[:limit].to_i

    # Search Twitter by our search argument (query), and return 10 recent results
    t = Twitter.search(args[:query], :count => limit, :result_type => "recent")
    puts "#{t.statuses.count} results"
    if t.statuses.count > 0
      t.statuses.each do |tweet|
        # Print each post and date to console
        puts "#{tweet.created_at} #{tweet.text}"
        # Save the twitter post to the database
        Tweet.create(:post => tweet.text)
      end
    else
      # If our search returned no results, say so.
      puts "No search results for #{args[:query]}"
    end

  end

end
