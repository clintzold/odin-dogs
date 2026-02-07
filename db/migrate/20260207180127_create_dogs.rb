class CreateDogs < ActiveRecord::Migration[8.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.integer :weight
      t.string :breed

      t.timestamps
    end
  end
end
