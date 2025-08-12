class PostPolicy < ApplicationPolicy
  def edit?
    user_owns_post?
  end

  def update?
    user_owns_post?
  end

  def destroy?
    user_owns_post?
  end

  private

  def user_owns_post?
    user == record.user
  end
  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
