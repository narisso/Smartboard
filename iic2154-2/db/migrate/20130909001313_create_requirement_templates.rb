class CreateRequirementTemplates < ActiveRecord::Migration
  def change
    create_table :requirement_templates do |t|
      t.string :name
      t.text :template_form

      t.timestamps
    end
  end
end
