# encoding: UTF-8
class Customer
  include DataMapper::Resource

  property :id,         Serial
  property :name,      String
  property :visit_time,   DateTime
  property :created_at, 		DateTime
end