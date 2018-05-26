class AwesomeBackup::PostgresBackupService < AwesomeBackup::ApplicationService
  def execute!
    `#{pg_dump_command} > \"#{tempfile_path}\"`

    size = File.size(tempfile_path)

    backup = AwesomeBackup::PostgresBackup.create!
    backup.file.attach(
      io: File.open(tempfile_path),
      filename: "database.dump"
    )

    ServicePattern::Response.new(result: {backup: backup})
  end

private

  def database_config
    @database_config ||= Rails.configuration.database_configuration.fetch(Rails.env)
  end

  def pg_dump_command
    command = "pg_dump --format=c"
    command << " -U \"#{database_config.fetch("username")}\"" if database_config["username"].present?
    command << " \"--host=#{database_config.fetch("host")}\"" if database_config["host"].present?
    command << " \"--port=#{database_config.fetch("port")}\"" if database_config["port"].present?

    if database_config["password"].present?
      command << " \"--password=#{database_config.fetch("password")}\""
    else
      command << " --no-password"
    end

    command << " \"#{database_config.fetch("database")}\""
    command
  end

  def tempfile_path
    @tempfile_path ||= "#{Dir.tmpdir}/#{SecureRandom.hex}.dump"
  end
end
