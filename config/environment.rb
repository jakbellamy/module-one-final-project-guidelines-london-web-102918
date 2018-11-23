require 'bundler'
Bundler.require

require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

ActiveRecord::Base.logger = nil
require 'io/console'


require_all 'app'
require_all 'lib'
