class InsecureUserSerializer < ActiveModel::Serializer
    attributes :id, :username, :password_digest
    
    def username
        object.username
    end
    
    def password
        object.password_digest
    end
end