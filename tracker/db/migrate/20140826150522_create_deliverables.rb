class CreateDeliverables < ActiveRecord::Migration
  def change
    create_table :deliverables do |t|
      t.belongs_to :project
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
