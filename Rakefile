Path = File.dirname(__FILE__)

task :default => :install
task :install => [:rcfiles, :submodules, :build]

task :rcfiles do
  %w(.vimrc .gvimrc).each do |file|
    system "ln -sfn #{File.join(Path, file)} $HOME"
  end
end

task :submodules do
  system "git submodule update --init"
end

task :build do
  system "cd #{File.join(Path, "bundle", "command-t")} ; rake make"
end

