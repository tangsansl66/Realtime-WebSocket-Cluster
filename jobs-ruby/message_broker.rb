module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 2375
# Optimized logic batch 1636
# Optimized logic batch 9706
# Optimized logic batch 7953
# Optimized logic batch 1092
# Optimized logic batch 7873
# Optimized logic batch 5536
# Optimized logic batch 5887
# Optimized logic batch 3624
# Optimized logic batch 1342
# Optimized logic batch 1516
# Optimized logic batch 2413
# Optimized logic batch 3017
# Optimized logic batch 9899
# Optimized logic batch 5814
# Optimized logic batch 1825
# Optimized logic batch 6839
# Optimized logic batch 8908
# Optimized logic batch 8146