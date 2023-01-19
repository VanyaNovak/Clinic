class AppointmentsController < BaseController
  def index
    all_appointments = Appointment.all.includes(:doctors, :patients)
    current_user.doctor? ? @appointments = all_appointments.where(doctor_id: current_user.id) : @appointments = all_appointments.where(patient_id: current_user.id)

    @new_appointments = @appointments.where(status: Appointment::NEW)
    @completed_appointments = @appointments.where(status: Appointment::COMPLETED)
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to appointment_path(@appointment.id)
    else
      flash[:alert] = @appointment.errors.first.type

      redirect_to categories_path
    end
  end

  def add_recommendation
    Appointment.find(update_params[:appointment_id]).update(
      recommendation: update_params[:recommendation],
      status: Appointment::COMPLETED
    )

    redirect_to(appointment_path(update_params[:appointment_id]))
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :title)
  end

  def update_params
    params.require(:appointment).permit(:recommendation, :appointment_id)
  end
end
