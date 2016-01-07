class Ability
  include CanCan::Ability  
  def initialize(user)
    
   user ||= User.new(role: 2) 
        if user.admin?
            can :manage, :all
        elsif user.client?
             can :read, :all
             can :create, :all
             can :upvote , :all
             can :downvote, :all
             can :favorite, :all
             can :destroy, [Post] , user_id: user.id
             can :search, :all
              can :edit, [Post] , user_id: user.id
              can :update, [Post] , user_id: user.id
              else
             can :read, :all
             can :search, :all
        end
  end
end

