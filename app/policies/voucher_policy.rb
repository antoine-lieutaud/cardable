class VoucherPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user
  end

  def new?
    create?
  end

  def show?
    true
  end

end
