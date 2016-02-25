class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :type
      t.string :uuid
      t.string :url

      t.timestamps null: false
    end
  end
end
