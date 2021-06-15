$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'acts_as_table_csv/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'acts_as_table_csv'
  s.version     = ActsAsTableCsv::VERSION
  s.authors     = ['Mark Borkum']
  s.email       = ['mark.borkum@pnnl.gov']
  s.homepage    = 'https://github.com/pnnl/acts_as_table_csv'
  s.metadata    = {
    'bug_tracker_uri' => 'https://github.com/pnnl/acts_as_table_csv/issues',
    'source_code_uri' => 'https://github.com/pnnl/acts_as_table_csv',
  }
  s.summary     = 'CSV support for ActsAsTable.'
  s.description = 'ActsAsTable extension for parsing/serializing CSV data.'
  s.license     = 'BSD-3-Clause'

  s.files = Dir['.yardopts', 'lib/**/*', 'LICENSE', 'Rakefile', 'README.md']

  s.add_runtime_dependency 'acts_as_table', '>= 0.0.1', '< 0.1'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'redcarpet'
  s.add_development_dependency 'yard'
end
