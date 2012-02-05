Path = File.dirname(__FILE__)

task :rcfiles do
  %w(.vimrc .gvimrc).each do |file|
    `ln -sfn #{File.join(Path, file)} $HOME`
  end
end

task :submodules do
  `git submodule update --init`
end

task :build do
  `cd #{File.join(Path, "bundle", "command-t")} ; rvm use system ; rake make`
end

task :install => [:rcfiles, :submodules, :build]
task :default => :install
