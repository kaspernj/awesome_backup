require "rails_helper"

describe AwesomeBackup::PostgresBackupService do
  describe "#execute!" do
    it "creates a backup" do
      expect { AwesomeBackup::PostgresBackupService.execute! }
        .to change(AwesomeBackup::PostgresBackup, :count).by(1)
    end
  end
end
