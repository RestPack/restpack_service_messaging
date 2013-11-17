module Messaging
  module Activity
    class Create < RestPack::Service::Command
      required do
        integer :application_id
        integer :user_id
        string  :content
      end

      optional do
        string  :title, empty: true
        string  :tags, empty: true
        string  :access, empty: true
        float   :latitude
        float   :longitude
        model   :data, class: Hash
      end

      def execute
        job_id = Rubykiq.push(
          class: 'Jobs::Activities::Activity::Create',
          queue: 'activity',
          args: [inputs]
        )

        {
          job_id: job_id
        }
      end
    end
  end
end
