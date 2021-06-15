require 'csv'

module ActsAsTable::CSV
  # ActsAsTable reader object for comma-separated values (CSV) format.
  class Reader < ActsAsTable::Reader
    # Returns a new ActsAsTable reader object for comma-separated values (CSV) format using the given ActsAsTable row model, input stream and options.
    #
    # @param [ActsAsTable::RowModel] row_model
    # @param [IO] input
    # @param [Hash<Symbol, Object>] options
    # @yieldparam [ActsAsTable::CSV::Reader] reader
    # @yieldreturn [void]
    # @return [ActsAsTable::CSV::Reader]
    #
    # @note Delegates input stream and options to constructor for +CSV+ object.
    # @see ::CSV.new
    def initialize(row_model, input = $stdin, **options, &block)
      # @return [Hash<Symbol, Object>]
      csv_options = (options[:csv] || {}).merge({
        headers: false,
      })

      @csv = ::CSV.new(input, **csv_options)

      super(row_model, input, **options, &block)
    end

    # Returns the line number of the last row read from the input stream.
    #
    # @return [Fixnum]
    def lineno
      @csv.lineno
    end

    # Returns a pair, where the first element is the next row or +nil+ if input stream is at end of file and the second element indicates if input stream is at end of file.
    #
    # @return [Object]
    def read_row
      # @return [Array<#to_s>, nil]
      row = @csv.shift

      if row.nil?
        [row, true]
      else
        row = row.collect(&:to_s).collect(&:strip).collect { |s| s.empty? ? nil : s }

        if row.all?(&:nil?)
          row = nil
        end

        [row, false]
      end
    end
  end
end
