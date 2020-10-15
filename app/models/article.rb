#Placeholder for a model

class Article < ActiveRecord::Base

    def change
        create_table :articles do |a|
            a.string :title
            a.string :content
        end
    end

end