class CreateUserHasClassrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :user_has_classrooms do |t|
      t.references :user, foreign_key: true
      t.references :classroom, foreign_key: true
      t.references :user_type, foreign_key: true

      t.timestamps
    end
  end
end
