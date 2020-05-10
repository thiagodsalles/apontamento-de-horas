class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :status, null: false, default: 'doing'
      t.text :reason
      t.datetime :started_at, null: false
      t.datetime :finished_at
      t.references :user, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
