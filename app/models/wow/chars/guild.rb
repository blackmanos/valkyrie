class Wow::Chars::Guild < Wow::Chars
  self.table_name = 'guild'

  paginates_per 25
end
