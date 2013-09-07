class CreateJenkinsTests < ActiveRecord::Migration
  def change
    create_table :jenkins_tests do |t|

      t.timestamps
    end
  end
end
