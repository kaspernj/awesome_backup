require "rails_helper"

describe AwesomeBackup::PostgresBackupService do
  describe "#execute!" do
    it "creates a backup" do
      expect { AwesomeBackup::PostgresBackupService.execute! }
        .to change(AwesomeBackup::PostgresBackup, :count).by(1)

      created_backup = AwesomeBackup::PostgresBackup.last

      expect(created_backup.file.filename).to eq "database.dump"
      expect(created_backup.file.blob.byte_size).to be > 10_000
    end
  end
end
