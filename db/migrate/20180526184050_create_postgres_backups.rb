class CreatePostgresBackups < ActiveRecord::Migration[5.2]
  def change
    create_table :awesome_backup_postgres_backups, &:timestamps
  end
end
