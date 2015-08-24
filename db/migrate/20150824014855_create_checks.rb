class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.text :comment
      t.boolean :guide

      t.timestamps null: false
    end
  end
end
