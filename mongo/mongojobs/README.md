**Working through a Mongo-backed project**

1. Grab the basic rails project and bundle it
	* No need to db:migrate or anything, since we don't have a schema 
2. Generate a Job model and open job.rb
3. Add the following fields and types to Job:
	* company: string
	* position: string
	* description: string
	* skills: hash
	* perks: array
	* date_posted: datetime
4. `rake db:seed` should add 20 job posts with FactoryGirl
5. Open the rails console `rails c` and let's see what our data looks like
	* `j = Job.first` should return a Job object with data populated
	* Inspect the data structure of our object with `pp j.attributes`
		* Look at all the fields, particularly at skills, perks, date_posted, and _id.
6. Open test/factories.rb and inspect.  Look at the data structure
7. Now, back in the console, type `Job.all` and see what is returned
	* In ActiveRecord, doing so would return an array of objects that were related to our query.  Now, all we see is some object called `Mongoid::Criteria` and some attributes.  This is what's called a "cursor", or a placemarker for your query.
	* Now, iterate over `Job.all` and puts the company attribute for each item, and you should see a list of Company 1-10 names on screen.

**Now, let's create some relationships**

1. Comment out the lines that define the fields "skills" and "perks" in the Job model
2. Generate a model `Perk` with a name field of type string
3. Let's say that Perk belongs to Job, and Job has many Perks
4. This relationship is the same as one would expect in ActiveRecord
	* Create a new Job, a new Perk, and then assign the Perk to the Job `j.perks << perk`
5. Mongoid introduces a new relationship where models are embedded within another, so generate a new moidel called "Skill" and give it some fields: required skills as an array, recommended skills as an array, years experience as an integer, and level of education as a string
6. To embed a model within another, the `Skill` model is `embedded_in :jobs` and `Job` `embeds_one :skill`.  This relationship can also say `embeds_many :skills` to have an array of skills.
7. Try creating a new skill and decipher the error message `s = Skill.create()` (it needs a parent document)
8. On the Job model we created (probably `Job.last`), `j.skill` should now return `nil`
9. `s = Skill.new()` creates the model without saving, and now we can add it to the job `j.skill = s`
10. Now, whenever we `job.save()`, it will save all of its own attributes including the skill model we just assigned to it.  Also, we can modify the skill model alone and `s.save()` to just save that embedded document


