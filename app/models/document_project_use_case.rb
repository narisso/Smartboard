class DocumentProjectUseCase < ActiveRecord::Base
  attr_accessible :document_project_id, :use_case_id

  belongs_to :document_project
  belongs_to :use_case
end
