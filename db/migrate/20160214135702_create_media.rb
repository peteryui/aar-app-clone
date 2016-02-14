class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :file_name
      t.timestamps null: false
    end
  end
end
