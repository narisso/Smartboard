class CreateUseCaseTemplates < ActiveRecord::Migration
  def change
    create_table :use_case_templates do |t|
      t.string :name
      t.text :template_form

      t.timestamps
    end
  end
end
