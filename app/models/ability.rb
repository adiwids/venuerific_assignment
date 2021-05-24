# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.administrator?
      can :manage, :all
    else
      can :manage, Article, author_id: user.id
    end
  end
end
