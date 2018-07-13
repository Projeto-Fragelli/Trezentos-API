class CreateUserHasExams < ActiveRecord::Migration[5.2]
  def change
    create_table :user_has_exams do |t|
      t.references :user, foreign_key: true
      t.references :exam, foreign_key: true
      
      t.timestamps
    end
  end
end
