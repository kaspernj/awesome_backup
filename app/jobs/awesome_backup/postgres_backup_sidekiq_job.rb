if defined?(Sidekiq)
  # This class can be used with Sidekiq Scheduler
  class AwesomeBackup::PostgresBackupSidekiqJob
    include Sidekiq::Worker

    def perform
      AwesomeBackup::PostgresBackupService.execute!
    end
  end
end
