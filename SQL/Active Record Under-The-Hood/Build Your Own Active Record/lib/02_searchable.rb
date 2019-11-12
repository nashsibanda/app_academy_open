require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_arr = params.keys.map { |col| "#{col} = ?" }
    where_line = where_arr.join(" AND ")
    rows = DBConnection.execute(<<-SQL, params.values)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{where_line}
    SQL
    self.parse_all(rows)
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
