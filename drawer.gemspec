Gem::Specification.new do |s|
  s.name = 'drawer'
  s.version = '0.0.7'
  s.date = %q{2008-12-05}
  s.summary = %{Ultra light file-based cache.}
  s.email = "michel@soveran.com"
  s.author = "Michel Martens"
  s.homepage = "http://github.com/soveran/drawer"

  s.specification_version = 2 if s.respond_to? :specification_version=

  s.files = ["lib/drawer/console.rb", "lib/drawer/irb.rb", "lib/drawer.rb", "README.rdoc", "LICENSE", "Rakefile", "example/db/development.yml", "example/drawer_sample.rb", "example/drawer_sample_gem.rb", "test/db/test.yml", "test/drawer_test.rb"]

  s.require_paths = ['lib']
  s.bindir = "bin"
  s.executables = "drawer"

  s.has_rdoc = false
end

