module RestPack::Service::Messaging::Commands
  module Email
    class SendRaw < RestPack::Service::Command
      required do
        integer :application_id
        string :from #TODO: GJ: add email validation
        string :to
        string :subject
        string :text_body
      end

      optional do
        string :cc
        string :bcc
        string :reply_to
        string :html_body
      end

      def execute
        job_id = Rubykiq.push(
          class: 'Jobs::Email::SendRaw',
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
