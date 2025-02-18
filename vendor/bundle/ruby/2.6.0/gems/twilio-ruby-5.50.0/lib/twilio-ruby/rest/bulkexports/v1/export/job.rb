##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Bulkexports < Domain
      class V1 < Version
        class ExportList < ListResource
          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class JobList < ListResource
            ##
            # Initialize the JobList
            # @param [Version] version Version that contains the resource
            # @return [JobList] JobList
            def initialize(version)
              super(version)

              # Path Solution
              @solution = {}
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Bulkexports.V1.JobList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class JobPage < Page
            ##
            # Initialize the JobPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [JobPage] JobPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of JobInstance
            # @param [Hash] payload Payload response from the API
            # @return [JobInstance] JobInstance
            def get_instance(payload)
              JobInstance.new(@version, payload, )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Bulkexports.V1.JobPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class JobContext < InstanceContext
            ##
            # Initialize the JobContext
            # @param [Version] version Version that contains the resource
            # @param [String] job_sid The unique string that that we created to identify the
            #   Bulk Export job
            # @return [JobContext] JobContext
            def initialize(version, job_sid)
              super(version)

              # Path Solution
              @solution = {job_sid: job_sid, }
              @uri = "/Exports/Jobs/#{@solution[:job_sid]}"
            end

            ##
            # Fetch the JobInstance
            # @return [JobInstance] Fetched JobInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              JobInstance.new(@version, payload, job_sid: @solution[:job_sid], )
            end

            ##
            # Delete the JobInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
               @version.delete('DELETE', @uri)
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Bulkexports.V1.JobContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Bulkexports.V1.JobContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class JobInstance < InstanceResource
            ##
            # Initialize the JobInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] job_sid The unique string that that we created to identify the
            #   Bulk Export job
            # @return [JobInstance] JobInstance
            def initialize(version, payload, job_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'resource_type' => payload['resource_type'],
                  'friendly_name' => payload['friendly_name'],
                  'details' => payload['details'],
                  'start_day' => payload['start_day'],
                  'end_day' => payload['end_day'],
                  'job_sid' => payload['job_sid'],
                  'webhook_url' => payload['webhook_url'],
                  'webhook_method' => payload['webhook_method'],
                  'email' => payload['email'],
                  'url' => payload['url'],
                  'job_queue_position' => payload['job_queue_position'],
                  'estimated_completion_time' => payload['estimated_completion_time'],
              }

              # Context
              @instance_context = nil
              @params = {'job_sid' => job_sid || @properties['job_sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [JobContext] JobContext for this JobInstance
            def context
              unless @instance_context
                @instance_context = JobContext.new(@version, @params['job_sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The type of communication – Messages, Calls, Conferences, and Participants
            def resource_type
              @properties['resource_type']
            end

            ##
            # @return [String] The friendly name specified when creating the job
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [Hash] This is a list of the completed, pending, or errored dates within the export time range, with one entry for each status with more than one day in that status
            def details
              @properties['details']
            end

            ##
            # @return [String] The start time for the export specified when creating the job
            def start_day
              @properties['start_day']
            end

            ##
            # @return [String] The end time for the export specified when creating the job
            def end_day
              @properties['end_day']
            end

            ##
            # @return [String] The job_sid returned when the export was created
            def job_sid
              @properties['job_sid']
            end

            ##
            # @return [String] The optional webhook url called on completion
            def webhook_url
              @properties['webhook_url']
            end

            ##
            # @return [String] This is the method used to call the webhook
            def webhook_method
              @properties['webhook_method']
            end

            ##
            # @return [String] The optional email to send the completion notification to
            def email
              @properties['email']
            end

            ##
            # @return [String] The url
            def url
              @properties['url']
            end

            ##
            # @return [String] This is the job position from the 1st in line. Your queue position will never increase. As jobs ahead of yours in the queue are processed, the queue position number will decrease
            def job_queue_position
              @properties['job_queue_position']
            end

            ##
            # @return [String] this is the time estimated until your job is complete. This is calculated each time you request the job list. The time is calculated based on the current rate of job completion (which may vary) and your job queue position
            def estimated_completion_time
              @properties['estimated_completion_time']
            end

            ##
            # Fetch the JobInstance
            # @return [JobInstance] Fetched JobInstance
            def fetch
              context.fetch
            end

            ##
            # Delete the JobInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Bulkexports.V1.JobInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Bulkexports.V1.JobInstance #{values}>"
            end
          end
        end
      end
    end
  end
end