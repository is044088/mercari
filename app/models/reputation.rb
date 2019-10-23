class Reputation < ApplicationRecord
  belongs_to :rater, class_name: 'User'
  belongs_to :target, class_name: 'User'
end
