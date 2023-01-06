# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      return unless user.patient?
      can :create, Appointment
      can :read, Category

      return unless user.doctor?
      can :manage, Appointment
  end
end
