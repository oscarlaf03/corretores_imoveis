class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    is_owner?
  end

  def update?
    is_owner?
  end


end
