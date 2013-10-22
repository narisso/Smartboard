class AddTemplateToUseCase < ActiveRecord::Migration
  def change
  	add_column :use_cases, :use_case_template_id, :integer
  	add_column :use_cases, :data, :text
  end
end
