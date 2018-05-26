class AwesomeBackup::PostgresBackup < AwesomeBackup::ApplicationRecord
  has_one_attached :file
end
