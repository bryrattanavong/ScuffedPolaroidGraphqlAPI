module Queries
    class SearchImages < BaseQuery
        argument :options, [String], required: false

        type Types::ImageType.connection_type, null: false

        def resolve(options: nil)
            results = []
            options.each do |option|
                if option.start_with?('#')
                    tag  = option.gsub('#', '')
                    images = Image.joins(:hash_tags).where(hash_tags:{name:tag})
                    images.each do |image|
                        results.append(image)
                    end
                else
                    images = Image.joins(:people).where(people:{name:option})
                    images.each do |image|
                        results.append(image)
                    end
                end
            end
            results
        end
    end
end