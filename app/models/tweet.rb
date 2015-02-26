class Tweet < ActiveRecord::Base
  validates :content, presence: true
  # maybe a validation for length?
end
