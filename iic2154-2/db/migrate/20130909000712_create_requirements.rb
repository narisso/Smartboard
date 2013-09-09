class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :name
      t.string :type
      t.text :data
      t.integer :template_id
      t.integer :use_case_id

      t.timestamps
    end
  end
end
