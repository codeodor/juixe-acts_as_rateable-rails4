# Include hook code here
require 'acts_as_rateable/acts_as_rateable'
require 'acts_as_rateable/rating'
ActiveRecord::Base.send(:include, Juixe::Acts::Rateable)
