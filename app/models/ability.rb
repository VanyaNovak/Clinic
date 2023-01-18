# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil?

    if user.patient?
      can :create, Appointment
      can :index, Appointment
      can :show, Appointment.where(patient_id: user.id)

      can :index, Category

      # Patient can see only personal or doctor profile
      can :show, Doctor
      can :show, User.find(user.id)
      can :update, User.find(user.id)
    end

    if user.doctor?
      # Doctor can add recommendations and see appointments which related to him
      can :index, Appointment
      can :show, Appointment.where(doctor_id: user.id)
      can :add_recommendation, Appointment

      # Doctor can see all profiles
      can :show, User
      can :update, User.find(user.id)
    end
  end
end
