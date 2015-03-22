dir = File.expand_path(File.join(__FILE__, '../..'))
worker_processes 1
working_directory dir
timeout 30
listen 3000

# Set process id path
pid "#{dir}/tmp/pids/unicorn.pid"

# Set log file paths
stderr_path "#{dir}/log/unicorn.stderr.log"
stdout_path "#{dir}/log/unicorn.stdout.log"

# Load gems from this location
before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{dir}/Gemfile"
end

# Unicorn creates a unicorn.pid.oldbin file when sent
# a USR2 signal. This makes it so we can send a QUIT
# signal to the old master process while we're starting
# the latest deployed unicorn.
before_fork do |server, worker|
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      Process.kill('QUIT', File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # it's already dead
    end
  end
end