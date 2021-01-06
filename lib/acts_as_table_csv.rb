require 'active_support/core_ext/module'

begin
  require 'rails/engine'
  require 'acts_as_table_csv/engine'
rescue ::LoadError
  # void
end

require 'acts_as_table_csv/version'

# ActsAsTable extension for parsing/serializing CSV data.
module ActsAsTableCsv
  extend ::ActiveSupport::Autoload

  autoload :VERSION
end
