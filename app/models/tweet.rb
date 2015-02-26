class Tweet < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :user
  # maybe a validation for length?
end
