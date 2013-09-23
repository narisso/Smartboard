class TestCase < ActiveRecord::Base
  attr_accessible :approved, :description, :executed_at, :evaluation_id

  belongs_to :evaluation
  has_one :bug
end
