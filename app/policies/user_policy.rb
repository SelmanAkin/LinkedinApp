class UserPolicy < ApplicationPolicy
  def show?
    true  
  end

  def update?
    user == record  
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
