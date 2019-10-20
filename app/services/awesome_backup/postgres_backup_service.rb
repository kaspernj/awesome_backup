require "English"

class AwesomeBackup::PostgresBackupService < AwesomeBackup::ApplicationService
  def execute
    result = `#{pg_dump_command} > \"#{tempfile_path}\"`
    raise "Command failed: #{result}" unless $CHILD_STATUS.exitstatus.zero?

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
    command << pg_dump_username_argument.to_s
    command << pg_dump_host_argument.to_s
    command << pg_dump_port_argument.to_s

    if database_config["password"].present?
      command.prepend("PGPASSWORD=\"#{database_config.fetch("password")}\" ")
    else
      command << " --no-password"
    end

    command << " \"#{database_config.fetch("database")}\""
    command
  end

  def pg_dump_host_argument
    " \"--host=#{database_config.fetch("host")}\"" if database_config["host"].present?
  end

  def pg_dump_port_argument
    " \"--port=#{database_config.fetch("port")}\"" if database_config["port"].present?
  end

  def pg_dump_username_argument
    " -U \"#{database_config.fetch("username")}\"" if database_config["username"].present?
  end

  def tempfile_path
    @tempfile_path ||= "#{Dir.tmpdir}/#{SecureRandom.hex}.dump"
  end
end
