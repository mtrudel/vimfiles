task :default => :submodules

task :submodules do
  system "git submodule update --init"
  system "vim +PluginInstall +qall"
end
