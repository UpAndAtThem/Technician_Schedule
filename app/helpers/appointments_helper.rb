module AppointmentsHelper
  def cellTimeMap
    res = [];

    4.times do |tech_id|
      work_day = Time.new 2019, 10, 1, 6
      121.times do |time|
        hour = work_day.hour.to_s
        min = work_day.min.to_s.length == 1 ? '0' + work_day.min.to_s : work_day.min.to_s
        work_day = work_day + (60 * 5)

        res << "<div class='invisible tech-#{tech_id + 1} #{hour}:#{min}' style='grid-column: tech#{tech_id + 1}; grid-row: appointment-#{hour}#{min}'></div>"
      end
    end

    res
  end
end
