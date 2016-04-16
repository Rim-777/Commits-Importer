class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.datetime :date
      t.belongs_to :user
      t.string :sha
      t.string :message

      t.timestamps null: false
    end
  end
end
