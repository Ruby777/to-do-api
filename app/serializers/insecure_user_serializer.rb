class InsecureUserSerializer < ActiveModel::InsecureUserSerializer
    attributes :id, :email, :password, :full_name
    
    def full_name
        object.full_name
    end

    def email
        object.email
    end
    
    def password
        object.password
    end
end