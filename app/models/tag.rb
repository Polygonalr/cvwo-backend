class Tag < ApplicationRecord
    has_one :color
    has_and_belongs_to_many :tasks, :join_table => :tag_tasks
    # Ensure cascading delete
    before_destroy do
        tag_tasks = TagTask.where(tag_id: id)
        tag_tasks.each { |tag_task| tag_task.destroy }
    end
end
