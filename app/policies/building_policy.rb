class BuildingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    is_owner?
  end

  def update?
    is_owner?
  end

  def destroy?
    is_owner?
  end
end
