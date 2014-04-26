desc 'Lifts a fresh copy of the system'
task l: :environment do
  system 'rake db:migrate:reset'
  system 'rake db:seed'
  system 'rake searchkick:reindex CLASS=Course'
  system 'rails s'
end
