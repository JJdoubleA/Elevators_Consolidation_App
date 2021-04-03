class InterventionController < ApplicationController

    def get_intevention
    end

    def getData
        params = request.query_parameters{"id"}
        #field = request.query_parameters{"value"}

        @data = ""

        if params[:value] == 'building'
            @data = Building.where(customer_id: params[:id] )
        elsif params[:value] == 'battery'
            @data = Battery.where(building_id: params[:id])
        elsif params[:value] == 'column'
            @data = Column.where(battery_id: params[:id])
        elsif params[:value] == 'elevator'
            @data = Elevator.where(column_id: params[:id])
            puts "elevator"
        else
            @data =""
        end
        return render json: @data

        
    end
    def create

        @intervention = Intervention.new()
    
        @intervention.author_id = current_user.employee.id
        @intervention.customer_id = params[:customers]
        @intervention.building_id = params[:buildings] 
        @intervention.battery_id = params[:batteries]unless params[:columns] !=nil
        @intervention.column_id = params[:columns] unless params[:elevators] !=nil
        @intervention.elevator_id = params[:elevators] 
        @intervention.employee_id = params[:employees]
        @intervention.start_date = nil
        @intervention.end_date = nil
        @intervention.report = params[:report]
        @intervention.result = "Incomplete"
        @intervention.status = "Pending"



        @intervention.save
        
        
        if @intervention.save
            redirect_back fallback_location: root_path, notice: "Success"
        end

        puts params

        def intervention_params
            params.require(:intervention).permit(:author_id,:customer_id,:building_id,:battery_id,:column_id,:elevator_id,:employee_id,:start_date,:end_date, :status)
        end
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_USERNAME']
            config.token = ENV['ZENDESK_TOKEN']
        end
        ZendeskAPI::Ticket.create!(client, 
        :subject => "Intervention create by #{current_user.employee.first_name} #{current_user.employee.last_name}", 
        :comment => { 
          :value => "Requester: #{current_user.employee.first_name} #{current_user.employee.last_name}
                     Company Name: #{Customer.find(params[:customers]).company_name}
                     Building ID: #{params[:buildings]}
                     Battery ID: #{params[:batteries]}
                     Column ID: #{params[:columns]}
                     Elevator ID: #{params[:elevators]}
                     Assigned Employee: #{Employee.find(params[:employees]).first_name} #{Employee.find(params[:employees]).last_name}
                     Description: #{params[:description]}"
        }, 
        :requester => { 
            "name": "#{current_user.employee.first_name} #{current_user.employee.last_name}", 
            # "email": @lead.email 
        },
        :priority => "urgent",
        :type => "problem"
      )

    #   def letter
    #     name = params[:customers]
    #     name.split.map(&:first)
    # end
    end
    
end
