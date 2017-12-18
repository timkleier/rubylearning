class CreateMetaTags < ActiveRecord::Migration[5.1]
  def change
    create_table :meta_tags do |t|
      t.integer :meta_type
      t.string :name

      t.timestamps
    end
  end
end
