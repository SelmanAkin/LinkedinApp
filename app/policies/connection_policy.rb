class ConnectionPolicy < ApplicationPolicy
 def create?
    user != record.friend && record.status == 'pending'
  end

  def update?
    user == record.friend && record.status == 'pending'
  end

  def destroy?
    user == record.user || user == record.friend
  end
  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
