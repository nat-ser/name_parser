# frozen_string_literal: true
# sorts people in desired order
class PersonSorter
  def self.sort_with_opts!(people, opts = {})
    people.sort_by! do |person|
      a = []
      opts.each do |column_name, order|
        a << RevCmp.new(person.send(column_name)) unless order == "asc"
        a << person.send(column_name)
      end
      a
    end
  end
end

# used inside the sort_by method to sort in descending order
class RevCmp
  attr_reader :this

  def initialize(obj)
    @this = obj
  end

  def <=>(other)
    other.this <=> @this
  end
end
