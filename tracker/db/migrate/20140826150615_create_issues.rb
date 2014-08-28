class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.belongs_to :deliverable
      t.string :title
      t.string :body
      t.string :budgeted_time
      t.integer :priority

      t.timestamps
    end
  end
end
