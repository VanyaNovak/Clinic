class AppointmentsController < HomeController
  def index
    @appointments = Appointment.where(doctor_id: current_user.id) || Appointment.where(patient_id: current_user.id)
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    appointment = Appointment.create(appointment_params)

    redirect_to appointment_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:title, :doctor_id, :patient_id)
  end
end
