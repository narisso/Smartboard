class TestCase < ActiveRecord::Base
  attr_accessible :approved, :description, :executed_at, :test_id

  belongs_to :test
  has_one :bug
end
