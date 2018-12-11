class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :user

  def name
    object.name
  end

  def user
    object.user
  end
end
