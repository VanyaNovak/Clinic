class AppointmentsController < HomeController
  def index
    current_user.doctor? ? @appointments = Appointment.where(doctor_id: current_user.id) : @appointments = Appointment.where(patient_id: current_user.id)
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
      flash[:notice] = "Appointment creation failed"
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :title)
  end
end
