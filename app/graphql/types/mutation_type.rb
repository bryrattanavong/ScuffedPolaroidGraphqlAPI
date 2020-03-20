module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser, description: 'Create a user'
    field :signin_user, mutation: Mutations::SignInUser, description: 'Signs in a user'
    field :create_image, mutation: Mutations::CreateImage, description: 'Create a image'
    field :delete_image, mutation: Mutations::DeleteImage, description: 'Delete a image'
  end
end
