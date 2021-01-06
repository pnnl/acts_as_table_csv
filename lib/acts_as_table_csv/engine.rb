module ActsAsTableCsv
  class Engine < ::Rails::Engine
    isolate_namespace ActsAsTableCsv

    initializer 'acts_as_table_csv.append_format' do |app|
      ActsAsTable.configure do
        require 'acts_as_table/csv'

        config.formats << :CSV
      end
    end
  end
end
