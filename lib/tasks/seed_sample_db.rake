namespace :db do
  namespace :sample do
    desc "Populates the sample database"
    task :seed do
      puts "Populating the sample database"

      db_name = Rails.env.production? ? "sql_tutor" : ENV['DATABASE']
      db_path = File.expand_path('../../../db/seeds.sql', __FILE__)

      `psql #{db_name} < #{db_path}`
      Rake::Task['db:schema:dump'].invoke
    end
  end
end
