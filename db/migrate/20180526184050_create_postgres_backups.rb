class CreatePostgresBackups < ActiveRecord::Migration[5.2]
  def change
    create_table :awesome_backup_postgres_backups do |t|
      t.timestamps
    end
  end
end
