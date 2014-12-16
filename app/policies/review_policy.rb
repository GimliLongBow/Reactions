class ReviewPolicy < ApplicationPolicy
  attr_reader :user, :review
  # Which reviews can this user access?
  class Scope < Scope
    def resolve
      if user.admin?
        scope
      else
        scope.where(user: user)
      end
    end
  end

  def index?
    true
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  # Controller methods
  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

end
