class BuildingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not(latitude: nil, longitude:nil).order(created_at: :desc)
    end
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
