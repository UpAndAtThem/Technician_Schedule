require 'csv'
# The rake task to upload the bank excel file into the branch table
namespace :import do
  desc 'All Imports'
  task all: [:techs, :work_orders, :locations]

  desc "Import Techs from csv"
  task techs: :environment do
    tech_path = File.join Rails.root, 'technicians.csv';
    
    data = CSV.read tech_path
    
    data[1..-1].each do |tech|
      Technition.create({id: tech.first, name: tech.last})
    end
  end

  desc "Import Work Orders from csv"
  task work_orders: :environment do
    work_order_path = File.join Rails.root, 'work_orders.csv';
    
    data = CSV.read work_order_path
    
    data[1..-1].each do |work_order|
      orderHash = {
        id: work_order[0],
        technician_id: work_order[1],
        location_id: work_order[2],
        time: work_order[3],
        duration: work_order[4],
        price: work_order[5]
      };

      WorkOrder.create(orderHash)
    end
  end

  desc "Import Locations from CSV"
  task locations: :environment do
    locations_path = File.join Rails.root, 'locations.csv';
    
    data = CSV.read locations_path
    
    data[1..-1].each do |location|
      Location.create({id: location[0], name: location[1], city: location[2]})
    end
  end
end
