class ConsultationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def show?
      true
    end

    def create?
      true
    end

    def update?
      record.user == user || user.admin == true
    end

    def destroy?
      record.user == user || user.admin == true
    end
  end
end
