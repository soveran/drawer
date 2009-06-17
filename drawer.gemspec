Gem::Specification.new do |s|
  s.name = 'drawer'
  s.version = '0.0.8'
  s.summary = %{Ultra light file-based cache.}
  s.description = %{Ultra light file-based cache.}
  s.email = "michel@soveran.com"
  s.author = "Michel Martens"
  s.homepage = "http://github.com/soveran/drawer"
  s.rubyforge_project = "drawer"
  s.files = ["lib/drawer/console.rb", "lib/drawer/irb.rb", "lib/drawer.rb", "README.markdown", "LICENSE", "Rakefile", "example/db/development.yml", "example/drawer_sample.rb", "example/drawer_sample_gem.rb", "test/db/test.yml", "test/drawer_test.rb"]
  s.bindir = "bin"
  s.executables = "drawer"
end

