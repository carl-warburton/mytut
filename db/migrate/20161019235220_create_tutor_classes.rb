class CreateTutorClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :tutor_classes do |t|
      t.string :name
      t.string :password_digest
      t.references :tutor_booking, foreign_key: true

      t.timestamps
    end
  end
end
