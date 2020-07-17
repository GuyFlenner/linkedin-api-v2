module LinkedinV2
  module Helpers
    module Hash
      class << self
        def get_deep(hash, *fields)
          fields.inject(hash) {|acc,e| acc[e] if acc.is_a?(::Hash)}
        end

        def deep_merge(first, second)
          first.merge(second.to_h, &merger)
        end

        private

        def merger
          -> (_key, first_value, second_value) {
            if ::Hash === first_value && ::Hash === second_value
              first_value.merge(second_value, &merger)
            elsif ::Array === first_value && ::Array === second_value
              first_value | second_value
            else
              [ :undefined, nil, :nil ].include?(second_value) ? first_value : second_value
            end
          }
        end
      end
    end
  end
end
