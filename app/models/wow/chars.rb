class Wow::Chars < ActiveRecord::Base
  extend Wow::ClassMethods
  self.abstract_class = true
end