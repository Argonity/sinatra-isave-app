require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# to send PATCH and DELETE requests
use Rack::MethodOverride 

# mount other controllers with 'use'
run ApplicationController
use UsersController
use SavingsAccountsController
