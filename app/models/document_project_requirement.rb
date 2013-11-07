class DocumentProjectRequirement < ActiveRecord::Base
  attr_accessible :document_project_id, :requirement_id

  belongs_to :document_project
  belongs_to :requirement

end
