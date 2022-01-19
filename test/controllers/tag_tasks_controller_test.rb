require "test_helper"

class TagTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag_task = tag_tasks(:one)
  end

  test "should get index" do
    get tag_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_tag_task_url
    assert_response :success
  end

  test "should create tag_task" do
    assert_difference('TagTask.count') do
      post tag_tasks_url, params: { tag_task: { tag_id: @tag_task.tag_id, task_id: @tag_task.task_id } }
    end

    assert_redirected_to tag_task_url(TagTask.last)
  end

  test "should show tag_task" do
    get tag_task_url(@tag_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_tag_task_url(@tag_task)
    assert_response :success
  end

  test "should update tag_task" do
    patch tag_task_url(@tag_task), params: { tag_task: { tag_id: @tag_task.tag_id, task_id: @tag_task.task_id } }
    assert_redirected_to tag_task_url(@tag_task)
  end

  test "should destroy tag_task" do
    assert_difference('TagTask.count', -1) do
      delete tag_task_url(@tag_task)
    end

    assert_redirected_to tag_tasks_url
  end
end
