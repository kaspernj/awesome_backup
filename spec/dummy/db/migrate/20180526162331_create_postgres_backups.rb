class CreatePostgresBackups < ActiveRecord::Migration[5.2]
  def change
    create_table :postgres_backups do |t|
      t.string :file
      t.timestamps
    end
  end
end
