module TableInfo
  extend self

  DB = ActiveRecord::Base.connection

  def schema_for(table_name)
    metadata = {table_name: table_name}

    DB.transaction do
      metadata[:fields] = DB.execute("SELECT * FROM #{table_name} WHERE false").fields
      raise ActiveRecord::Rollback
    end

    metadata
  end
end
