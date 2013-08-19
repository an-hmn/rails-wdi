#Intro to MongoDB
During this segment, a few new words and terms will be mentioned.  It's important to note what they are and that they'll be explained in due time.

##What is MongoDB
MongoDB is a document-driven database that stores structured data as JSON-like objects.  It belongs to the NoSQL family of databases and is a schema-less key:value datastore (we'll get into what that means in a bit).

##Who makes it?
[10Gen](http://www.10gen.com/). They're in New York up by Times Square.

##What is this whole NoSQL thing?
NoSQL is basically a departure from the structured table databases into objects with attributes stored as key:value pairs (like a hash).  These databases are non-relational (i.e. no joins between collections through foreign keys) and have no schema: there are no fixed columns or data types except for a bulit-in _id field.

##What is MongoDB's data structure?
Hierarchically, Mongo has databases, and databases have collections (vs tables).  A collection is a set of what are called "documents" (vs. records) stored as JSON-like objects -- at the core of it, Mongo stores this as a binary version called BSON **not important.

You can have what ever structure you like: flat objects, nested arrays, hashes with arrays, etc., and a variety of [data types](http://mongoid.org/en/mongoid/docs/documents.html#fields): strings, text, arrays, hashes, dates, numbers, and more.  The benefit of a NoSQL database is that there is no defined structure, and no migrations are necessary.

##When should I use it?
When your data model fits.  MongoDB is fast when used properly, but if you have highly relational data, it may not be the best solution.  An ecommerce site, for example, has highly relational data (users order products to addresses, etc.) and something like Postgres or MySQL would probably work better.  It can be ideal, however, for things like archived data (i.e. order histories) or a blog.  There's no hardfast rule ([eCommerce data modeling with MongoDB](http://www.infoq.com/articles/data-model-mongodb)).

##How do I use it?
There are 2 primary gems for working with MongoDB in ruby (and rails): mongoid and mongo_mapper.  In this course, we will be using mongoid.  Since there is no db schema or structure, and no use of sql and joins, we actually don't need active record anymore.  To start a rails project ready for MongoDB we type:

	rails new [appname] --skip-active-record

or if you have an existing project where you want to replace your database with MongoDB, there are a few steps:

**config/application.rb**

	require "rails/all"

should change to

	require "action_controller/railtie"
	require "action_mailer/railtie"
	require "active_resource/railtie"
	require "rails/test_unit/railtie"

And then comment out any references to Active Record in your environment files:

**config/environments/development.rb**

	# config.active_record.mass_assignment_sanitizer = :strict
	# config.active_record.auto_explain_threshold_in_seconds = 0.5

**config/application.rb**

	# config.active_record.whitelist_attributes = true

Then, add the mongoid gem to your Gemfile and bundle install:

	gem 'mongoid'

**But wait!** how do my models work if they don't extend from ActiveRecord::Base?  Well, let's generate one and find out.  `rails generate model model title:string content: text` yields a class that looks like this:

	class Model
		include Mongoid::Document
		
		field :title, type: String
		field :content, type: String
		field :text, type: String
	end

Notice there is no inheritance but `Mongoid::Document` is included.  This achieves the same conceputual result and the mongoid module correctly maps this class to the database.


##Where can I go for resources?
[MongoDB](http://www.mongodb.org/) is very well [documented](http://docs.mongodb.org/manual/contents/) with a sprinkling of code samples, and [Mongoid](http://mongoid.org/en/mongoid/) has lots of documentation as well.

For further education, 10gen offers free online courses geared towards DBAs and programmers (in python).


------
#Console
Now we are going to go through some basic commands in MongoDB's console and get a better feel for what's going on.

Run `mongo` to connect to your localhost database server

To show all the databases on the server: `show dbs` and the result is something like:

	local	0.078125GB

To choose a database ("wdi" for example): `use wdi` which returns

	switched to db wdi

Now, let's see what collections are in test: `show collections`.  Nothing will be returned because it doesn't exist ****notice how there is no error***.  Technically, the database "wdi" doesn't exist yet either.

What is going on??  Well, remember that whole schema-less thing?  Nothing exists in a SQL database until you add databases, tables, and fields.  That's called a schema.  Take that out of the picture and you remove the ability (and necessity) to define a database's tables and fields.  It's only when you perform an operation or create a document when the database and respective collection are created.  Type `show dbs` again and you should now see:

	local	0.078125GB
	wdi		(empty)

The database has been "created" and cached for use.  Now, let's create a simple document on the "subjects" collection with values "name": "MongoDB" like so:

	db.subjects.insert({name: "MongoDB"})

A return to the cursor means success.  MongoDB has objects all over the place.  After we entered `use wdi`, we entered the "wdi" database.  `db` refers to our current database, and the collection follows `db.subjects`. **NOTE:** when first entering the console with `mongo`, it default connects to the `test` database and usually displays `connecting to: test`.

Mongo has a variety of operators for the typical manipulation of data (insert, find, update, remove) and more.  Let's see our inserted document by typing `db.subjects.find();` and something similar to the following should be returned:

	{ "_id" : ObjectId("5203e8ab1f3136a662506036"), "name" : "MongoDB" }

To update this document, the basic syntax is `db.subjects({query}, {fields to update}).  Let's add a field to this document called "hours" and give it a value of 1.

	db.subjects.update({name: "MongoDB"}, {hours: 1})

Running `db.subjects.find()` again shows our document has been changed, but not as expected:

	{ "_id" : ObjectId("5203e8ab1f3136a662506036"), "hours" : 1 }

Whenever you update a document with mongo through the console or direct mongo commands, this syntax replaces the entire selected object or set of objects (first parameter -- leave empty for all `{}`) with the object in the second parameter.  This is where Mongo's querying gets deeper, and frankly a bit complicated.  Mongoid does a good job of taking care of the more complex queries and if you're curious to dig deeper, check out MongoDB's [CRUD documentation](http://docs.mongodb.org/manual/crud/).

For the sake of this example and to not leave anyone hanging, this is how we update the one field on our document while keeping the other fields:

	db.subjects.update({name: "MongoDB"}, {$set: {hours: 1}})

`db.subjects.find()` should show that we have successfully added the field "hours" to our document, and "name" still exists.

Let's clear out all documents in the subjects collection:

	db.subjects.remove()

To only remove a subset of documents or just one document, add a selector object as a parameter:

	db.subjects.remove({"_id" : ObjectId("5203e8ab1f3136a662506036")})

