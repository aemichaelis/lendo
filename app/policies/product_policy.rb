class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def requests?
    true
  end

  def booked?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def myproducts?
    true
  end

  def confirm?
    true
  end
end
