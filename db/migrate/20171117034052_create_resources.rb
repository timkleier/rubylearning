class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :title
      t.string :description
      t.string :url
      t.string :root_url
      t.string :host
      t.string :image_url
      t.integer :ruby_or_rails
      t.integer :skill_level

      t.timestamps
    end
  end
end
