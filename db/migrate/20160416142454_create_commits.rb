class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.datetime :date
      t.belongs_to :user, index: true, foreign_key: true
      t.string :sha
      t.string :message

      t.timestamps null: false
    end
  end
end
