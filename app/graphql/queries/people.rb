module Queries
    class People < BaseQuery
      
      type Types::PersonType.connection_type, null: false
  
      def resolve
       Person.all
      end
    end
  end