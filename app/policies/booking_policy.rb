class BookingPolicy < ApplicationPolicy
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

  def confirm?
    true
  end

  def save_booking?
    true
  end

  def update?
    record.product.user == user
  end

  def destroy?
    record.user == user
  end
end
