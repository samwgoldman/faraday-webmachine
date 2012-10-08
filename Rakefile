require "bundler/gem_tasks"

begin
  require "rspec/core/rake_task"

  RSpec::Core::RakeTask.new(:spec)
  task :default => :spec
rescue LoadError
  warn "RSpec not installed; skipping spec task."
end

begin
  require "cane/rake_task"

  Cane::RakeTask.new(:quality)
  task :default => :quality
rescue LoadError
  warn "Cane not installed; skipping quality task."
end

task :default => :spec
