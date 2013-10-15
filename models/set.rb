class Set
  include DataMapper::Resource

  property :set_id,       Integer
  property :term_id,      Integer

  has n, :terms
end

DataMapper.finalize.auto_upgrade!
