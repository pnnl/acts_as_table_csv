require 'csv'

module ActsAsTable::CSV
  # ActsAsTable writer object for comma-separated values (CSV) format.
  class Writer < ActsAsTable::Writer
    # Returns a new ActsAsTable writer object for comma-separated values (CSV) format using the given ActsAsTable row model, output stream and options.
    #
    # @param [ActsAsTable::RowModel] row_model
    # @param [IO] output
    # @param [Hash<Symbol, Object>] options
    # @yieldparam [ActsAsTable::CSV::Writer] writer
    # @yieldreturn [void]
    # @return [ActsAsTable::CSV::Writer]
    #
    # @note Delegates output stream and options to constructor for +CSV+ object.
    # @see ::CSV.new
    def initialize(row_model, output = $stdout, **options, &block)
      # @return [Hash<Symbol, Object>]
      csv_options = (options[:csv] || {}).merge({
        headers: false,
      })

      @csv = ::CSV.new(output, **csv_options)

      super(row_model, output, **options, &block)
    end

    # Writes a row to the output stream.
    #
    # @param [Array<String, nil>, nil] row
    # @return [ActsAsTable::Writer]
    def write_row(row)
      @csv << row

      self
    end
  end
end
