class UserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :username, :password_digest

  #Delegate the practical definition of 'full_name' to
  #the User model, where it belongs, rather than
  #(re)defining it here

  def username
    object.username
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

  def password_digest
    object.password_digest
  end
end
