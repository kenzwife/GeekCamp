class CreateCamps < ActiveRecord::Migration[6.1]
  def change
    create_table :camps do |t|
      t.string :title
      t.text :body
      t.string :location

      t.timestamps
    end
  end
end
