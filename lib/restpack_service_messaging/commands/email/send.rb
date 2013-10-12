module RestPack::Service::Messaging::Commands
  module Email
    class Send < RestPack::Service::Command
      required do
        integer :application_id
        string :from #TODO: GJ: add email validation
        string :to
        string :subject
        string :template
      end

      optional do
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
