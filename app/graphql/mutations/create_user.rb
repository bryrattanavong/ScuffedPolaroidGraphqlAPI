module Mutations
  class CreateUser < BaseMutation

    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
  
    type Types::UserType

    def resolve(name: nil, email: nil, password: nil)
      User.create!(
        name: name,
        email: email,
        password: password
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end 