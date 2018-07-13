class CreateClassrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :classrooms do |t|
      t.references :user, foreign_key: true
      t.string :name, :null => false
      t.string :password_digest, :null => false
      t.string :institution, :null => false
      t.integer :cut_off, :null => false
      t.string :description, :null => false

      t.timestamps
    end
  end
end
