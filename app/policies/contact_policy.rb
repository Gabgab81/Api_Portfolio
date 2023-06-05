class ContactPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
      # scope.all
    end

  end

  def show?
    record.user == user
    # true
  end
  
  def create?
    # record.user == user
    !user.nil?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    # record.user == user
    update?
  end
end
