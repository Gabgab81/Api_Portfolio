class CreateTechProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :tech_projects do |t|
      t.references :technology, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
