class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :sex
      t.references :role, index: true

      t.timestamps
    end
  end
end
