class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    record.p1_id == user.id || record.p2_id == user.id
  end
end
