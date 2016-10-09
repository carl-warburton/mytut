class CreateStudentProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :student_profiles do |t|
      t.text :description
      t.string :subjects
      t.string :year
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
