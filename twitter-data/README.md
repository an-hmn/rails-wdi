#Rake Tasks
###Learning Objectives:
* Explain what a rake task is and when you would use one (automation, maintenance, etc.)
* Write a rake task with a parameter
* Keep your rake tasks organized by using different namespaces

###Topics:
* Description of a rake task, how it is initiated and how it differs from a rails route or independent command-line ruby script
* Understanding namespaces
* Using a parameter
* rails generate task namespace task1 task2 ...

##Rake tasks w/ Twitter

This app holds some examples of rake tasks.  The section below describes the examples demonstrated, and an overarching list is as follows:

* Using rails app models in a rake task
* Accepting one or more parameters when calling a rake task
* Setting up FactoryGirl factories, including a related model
	* Uses the Faker gem to generate lorem ipsum text

####Files of note:

**/lib/tasks/db.rake** shows how you can extend an existing namespace and add additional commands.  Also, the db:regenerate task demonstrates how to call another rake task from within a rake task `rake db:regenerate`

**/lib/tasks/twitter.rake** contains 3 rake tasks:

* twitter:posts uses FactoryGirl to generate  dummy users and twitter posts
	* Accepts a parameter (# of users)
	* `rake twitter:posts[10]` -- creates 10 users with a random number of twitter posts

* twitter:clear empties the User and Tweet tables
	* Simple task; shows how you can use rails models in a rake task
	* `rake twitter:clear`

* twitter:search uses the Twitter gem to search Twitter for a search query
	* Accepts two parameters: a search parameter (query) and the number of desired results (limit)
	* Outputs search results to the console and saves to the DB
* `rake twitter:search['to:justinbieber marry',50]`

**/test/factories.rb** Contains our FactoryGirl factories