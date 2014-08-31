class CreateUiPresets < ActiveRecord::Migration
  def change
    create_table :ui_presets do |t|
      t.string :name
      t.json :attrs

      t.timestamps
    end
  end
end
