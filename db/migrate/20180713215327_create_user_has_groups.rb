class CreateUserHasGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :user_has_groups do |t|
      t.decimal :grade, :null => false
      t.boolean :helper, :default => false
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
