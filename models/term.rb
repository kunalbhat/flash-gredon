class Term
  include DataMapper::Resource

  property :id,         Serial
  property :word,       String
  property :definition, Text
  property :ignore,     Boolean, default: false
end

DataMapper.finalize.auto_upgrade!
