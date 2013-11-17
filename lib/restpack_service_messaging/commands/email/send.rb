module Messaging
  module Email
    class Send < RestPack::Service::Command
      required do
        integer :application_id
        string :to
        string :template
      end

      optional do
        string :from #TODO: GJ: add email validation
        string :subject
        string :cc
        string :bcc
        string :reply_to
        hash :data
      end

      def execute
        inputs[:data] = raw_inputs[:data] if raw_inputs[:data]
        job_id = Rubykiq.push(
          class: 'Jobs::Email::Send',
          queue: 'email',
          args: [inputs]
        )

        {
          job_id: job_id
        }
      end
    end
  end
end
