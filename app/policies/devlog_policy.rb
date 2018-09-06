class DevlogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present?
        scope
      else
        scope.where(public: true)
      end
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def edit?
    user.present?
  end

  def update?
    user.present?
  end

  def destroy?
    user.present?
  end

  def drafts?
    user.present?
  end

end
