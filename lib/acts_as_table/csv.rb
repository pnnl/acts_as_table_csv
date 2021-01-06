require 'active_support/core_ext/module'

module ActsAsTable
  # ActsAsTable serialization format module for comma-separated values (CSV) format.
  module CSV
    extend ::ActiveSupport::Autoload

    autoload :Reader, 'acts_as_table/csv/reader'
    autoload :Writer, 'acts_as_table/csv/writer'

    # Returns the symbolic name for this ActsAsTable serialization format.
    #
    # @return [Symbol]
    def self.format
      :csv
    end

    # Returns a new ActsAsTable reader object for this serialization format.
    #
    # @param [Array<Object>] args
    # @yieldparam [ActsAsTable::CSV::Reader] reader
    # @yieldreturn [void]
    # @return [ActsAsTable::CSV::Reader]
    def self.reader(*args, &block)
      Reader.new(*args, &block)
    end

    # Returns a new ActsAsTable writer object for this serialization format.
    #
    # @param [Array<Object>] args
    # @yieldparam [ActsAsTable::CSV::Writer] writer
    # @yieldreturn [void]
    # @return [ActsAsTable::CSV::Writer]
    def self.writer(*args, &block)
      Writer.new(*args, &block)
    end
  end
end
