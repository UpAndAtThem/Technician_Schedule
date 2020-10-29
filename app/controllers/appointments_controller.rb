class AppointmentsController < ApplicationController
  def display
    @techs = Technition.all
    @work_order = WorkOrder.all.map do |workOrder|
      location = workOrder.location
      tech = Technition.find(workOrder.technician_id)
      
      appt_time = workOrder.time;
      date, time = appt_time.split(' ')

      hour, minute = time.split(':');
      month, date_number, year = date.split('/')
      
      end_time = Time.new('20'+ year, month, date_number, hour, minute) + (60 * workOrder.duration)

      start_time_row_area = 'appointment-' + workOrder.time.split(' ')[-1].split(":").join("")
      end_time = end_time.to_s.split(" ")[1][0..-4].split(":").join("")

      end_time_area = 'appointment-' + end_time

      {
        tech: tech,
        location: location,
        work_order: workOrder,
        tech_number: 'tech' + tech.id.to_s,
        start_time: start_time_row_area,
        end_time: end_time_area,
        duration: workOrder.duration
      }
    end
  end
end
