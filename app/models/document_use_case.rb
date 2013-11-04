class DocumentUseCase < ActiveRecord::Base
  attr_accessible :description, :name, :url_path, :use_case_id
end
