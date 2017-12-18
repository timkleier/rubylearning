# MetaTag model, for format, level, resource_type, etc.
class MetaTag < ApplicationRecord
  enum meta_type: { resource_type: 1, skill_level: 2 }
  validates_uniqueness_of :name
end
