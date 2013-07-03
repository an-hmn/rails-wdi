# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Artist.destroy_all
Painting.destroy_all

Artist.create(:name => 'Joan Miro', :nationality => 'Spanish', :dob => '1893/04/20',
       :period => '20th century',
       :image => 'http://upload.wikimedia.org/wikipedia/commons/5/5c/Portrait_of_Joan_Miro%2C_Barcelona_1935_June_13.jpg')
Painting.create(:title => 'The Flight of the Dragonfly in Front of the Sun', :year => '1968',
                :medium => 'oil on canvas', :style => 'Abstract Art',
                :image => 'http://www.joan-miro.net/images/paintings/the-flight-of-the-dragonfly-in-front-of-the-sun.jpg')
