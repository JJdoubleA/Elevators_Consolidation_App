# using SendGrid's Ruby Library
# https://github.com/sendgrid/sendgrid-ruby
require 'zendesk_api'
require 'sendgrid-ruby'
include SendGrid

class LeadsController < ApplicationController
    
    # POST /quotes or /quotes.json
    def create

        @lead = Lead.new(lead_params)
        

        #=====================#
        # DECLARING VARIABLES # 
        #=====================#
        attachment = params["attachment"]
        #@lead.file_name = attachment


        #====================================#
        # PRINTS PARAMS INTO TERMINAL WINDOW #
        #====================================#
        puts "===========START================"
        puts params
        puts "=============END================"


        #===============================================================================#
        # FORM SUBMISSION & FILE ATTACHMENT LOGIC                                       #
        # (converts into binary code, submission alert, redirecting, rendering, errors) #
        #===============================================================================#
        
        if attachment != nil
            @lead.attachment = attachment.read
            @lead.file_name = attachment.original_filename
        end
        

        #=================================#
        # Sending email from Sendgrid API #
        #=================================#

        from = Email.new(email: "jaytdot2k@gmail.com")
        to = Email.new(email: @lead.email)
        subject = 'Sending with SendGrid is Fun'
        content = Content.new(type: 'text/html', value: 'and easy to do anywhere, even with Ruby')
        mail = SendGrid::Mail.new(from, subject, to, content)
        
        personalization = Personalization.new
        personalization.add_to(Email.new(email: @lead.email))
        personalization.add_dynamic_template_data("FullName" => @lead.full_name_of_contact());
        personalization.add_dynamic_template_data("ProjectName"=> @lead.project_name());
        
        mail.template_id ='d-ab22bc2be7e44ad9bdbc5531c9b59f21'
        mail.add_personalization(personalization)

        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
        puts response.body
        puts response.headers 


        #==========================================#
        # CREATING THE TICKETS FOR THE ZENDESK API #
        #==========================================#
        
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_USERNAME']
            config.token = ENV['ZENDESK_TOKEN']
        end

        ZendeskAPI::Ticket.create!(client, 
            :subject => "#{@lead.full_name_of_contact} from #{@lead.company_name}", 
            :comment => { 
            :value => "The contact #{@lead.full_name_of_contact} from company #{@lead.company_name} can be reached at email #{@lead.email} and at phone number #{@lead.phone}. #{@lead.department_in_charge_of_elevators} has a project named #{@lead.project_name} which would require contribution from Rocket Elevators.
            Project Description: #{@lead.project_description}
                Attached Message:
                #{@lead.message}

                #{"The Contact uploaded an attachment" unless @lead.attachment.nil?}"
            }, 
            :requester => { 
                "name": @lead.full_name_of_contact, 
                "email": @lead.email 
            },
            :priority => "normal",
            :type => "question"
        )


        #=======#
        # SAVER #
        #=======#
        
        @lead.customer_id = nil;
        if @lead.save!
            redirect_back fallback_location: root_path, notice: "Your Request was successfully created and sent!"
        end            

    end # end def create

    private

    #===============================================#
    # DEFINING @lead = Lead.new(lead_params) BELOW: #
    #===============================================#

    # Only allow a list of trusted parameters through.
    def lead_params
        params.required(:leads).permit!
    end
    
end
