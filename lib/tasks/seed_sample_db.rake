namespace :db do
  namespace :sample do
    desc "Populates the sample database"
    task :seed => :environment do
      puts "Populating the sample database"

      db_path = File.expand_path('../../../db/seeds.sql', __FILE__)
      statements = File.read(db_path)
      ActiveRecord::Base.connection.execute(statements)

    end
  end
end
