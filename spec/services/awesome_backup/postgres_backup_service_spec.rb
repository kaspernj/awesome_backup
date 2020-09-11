require "rails_helper"

describe AwesomeBackup::PostgresBackupService do
  describe "#execute!" do
    it "creates a backup" do
      expect_any_instance_of(AwesomeBackup::PostgresBackupService).to receive(:run_command) # rubocop:disable RSpec/AnyInstance
      expect_any_instance_of(AwesomeBackup::PostgresBackupService).to receive(:attach_file) # rubocop:disable RSpec/AnyInstance
      expect { AwesomeBackup::PostgresBackupService.execute! }
        .to change(AwesomeBackup::PostgresBackup, :count).by(1)
    end
  end
end
