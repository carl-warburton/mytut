class CreateTutorProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :tutor_profiles do |t|
      t.text :description
      t.string :subject
      t.string :subject_year
      t.decimal :rates, precision: 8, scale: 2
      t.text :experience
      t.text :qualifications
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
