DataMapper.setup(:default, {
    :adapter  => 'mysql',
    :host     => 'localhost',
    :username => 'root' ,
    :password => '',
    :database => 'hunchy'})
    
class DmUser
  has n, :hunches
end
    
class Hunch
  include DataMapper::Resource
  belongs_to :dm_user
  property :id,        Serial                     
  property :hunch,     String,  :required => true
  property :created_at, DateTime
  property :updated_at, DateTime
end

DataMapper.finalize
    
# DataMapper.auto_migrate!