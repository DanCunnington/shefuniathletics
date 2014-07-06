require 'csv'

namespace :csv do

  desc "Import CSV Data"
  task :records => :environment do

    csv_file_path = 'db/records.csv'

    CSV.foreach(csv_file_path,:encoding => "windows-1251:utf-8") do |row|
      Record.create!({
        :id => row[0],
        :event => row[1],  
        :athlete => row[2],      
        :time => row[3],      
        :competition => row[4],      
        :event_type => row[7]           
      })
      puts "Row added!"
    end
  end
end