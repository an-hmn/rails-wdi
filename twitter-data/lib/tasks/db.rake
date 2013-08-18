# Extend the existing "db" namespace so we can add additional functionality
namespace :db do

  # Maybe the db:reset rake task isn't exactly working for our environment because we want to be sure our migrations are up to date.
  # Here is an example of running a rake task from within a rake task
  desc "drop, create, and migrate the database"
  task :regenerate => :environment do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
  end

end