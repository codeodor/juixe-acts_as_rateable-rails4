ActsAsRateable
==============

Install
-------
To get this running w/ bundler, use `gem 'acts_as_rateable', '1.0', git: 'https://github.com/codeodor/juixe-acts_as_rateable-rails4.git'`. The information below on installation is way out of date... and maybe other stuff as well.

== Resources

Install
 * Run the following command:
 script/plugin install http://juixe.com/svn/acts_as_rateable
  
 * Create a new rails migration and add the following self.up and self.down methods
 
  def self.up
    create_table "ratings", :force => true do |t|
      t.column "rating", :integer, :default => 0
      t.column "created_at", :datetime, :null => false
      t.column "rateable_type", :string, :limit => 15, :default => "", :null => false
      t.column "rateable_id", :integer, :default => 0, :null => false
      t.column "user_id", :integer, :default => 0, :null => false
    end
  
    add_index "ratings", ["user_id"], :name => "fk_ratings_user"
  end

  def self.down
    drop_table :ratings
  end
 
== Usage
 * Make you ActiveRecord model act as rateable.
 
 class Model < ActiveRecord::Base
 	acts_as_rateable
 end
 
 * Add a rating to a model instance
 
 model = Model.new
 rating = Rating.new(:rating => 1)
 model.ratings << rating
 
 * Each rating references the rateable object
 
 model = Model.find(1)
 model.ratings.get(0).rateable == model

== Credits

Xelipe - This plugin is heavily influced by Acts As Voteable.

== More

http://www.juixe.com/projects/acts_as_rateable
