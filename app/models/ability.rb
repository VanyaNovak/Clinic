# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil?

    if user.patient?
      can :create, Appointment
      can :read, Appointment
      can :read, Category
    end

    if user.doctor?
      can :read, Appointment
      can :add_recommendation, Appointment
    end
  end
end
