# CSV Support for ActsAsTable

This is an [ActsAsTable](https://github.com/pnnl/acts_as_table) extension that adds support for parsing/serializing [Comma-Separated Values](https://tools.ietf.org/html/rfc4180) (CSV) data.

* https://github.com/pnnl/acts_as_table_csv

## Documentation

* {ActsAsTable::CSV}
  * {ActsAsTable::CSV::Reader}
  * {ActsAsTable::CSV::Writer}

## Dependencies

* [ActsAsTable](https://github.com/pnnl/acts_as_table) (~> 0.0.1)

## Installation

The recommended installation method is via [RubyGems](http://rubygems.org/).
To install the latest, official release of the `ActsAsTable::CSV` gem, do:
```bash
% [sudo] gem install acts_as_table_csv
```

## Examples

```ruby
require 'acts_as_table'
```

### Writing CSV data

```ruby
# @return [ActsAsTable::RowModel]
@row_model = ...

# @return [Array<ActiveRecord::Base>]
@bases = ...

ActsAsTable.for(:csv).writer(@row_model, $stdout) do |writer|
  @bases.each do |base|
    writer << base
  end
end
```

### Reading CSV data

```ruby
# @return [ActsAsTable::RowModel]
@row_model = ...

# @return [ActsAsTable::Table]
@table = @row_model.tables.new

ActsAsTable.for(:csv).reader(@row_model, $stdin) do |reader|
  reader.each_row do |row|
    # @return [Array<ActsAsTable::Record>]
    records = @table.from_row(row)

    records.each do |record|
      record.position = reader.lineno
    end
  end
end
```

## Author

* [Mark Borkum](https://github.com/markborkum)

## License

This software is licensed under a 3-clause BSD license.

For more information, see the accompanying {file:LICENSE} file.
