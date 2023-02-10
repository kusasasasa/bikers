class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  validates :age, numericality: { only_integer: true }
end
