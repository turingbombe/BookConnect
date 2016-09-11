desc "This task updates the status of all clubs"
task :update_status => :environment do
  puts "Updating feed..."
  Club.status_update
  puts "done."
end