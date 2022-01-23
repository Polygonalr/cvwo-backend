class Task < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :tags, :join_table => :tag_tasks
    # Ensure cascading delete
    before_destroy do
        tag_tasks.each { |tag_task| tag_task.destroy }
    end
end
