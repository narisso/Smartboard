#Contains the model of the documents of a project associated to a use case.
class DocumentProjectUseCase < ActiveRecord::Base
  attr_accessible :document_project_id, :use_case_id

  belongs_to :document_project
  belongs_to :use_case
end
