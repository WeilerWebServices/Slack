require 'fileutils'

source = node["force-unlink"]["source"]
target = node["force-unlink"]["target"]

unless File.exists?(source)
  File.open(source, "w") { |f| f.puts "# source content" }
end

if File.symlink?(target)
  # noop, this is what we want
else
  File.unlink(target)
  FileUtils.ln_s(source, target)
end

# bad perms by default
File.chmod 0644, source, target
