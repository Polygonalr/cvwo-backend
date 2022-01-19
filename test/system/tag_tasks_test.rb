require "application_system_test_case"

class TagTasksTest < ApplicationSystemTestCase
  setup do
    @tag_task = tag_tasks(:one)
  end

  test "visiting the index" do
    visit tag_tasks_url
    assert_selector "h1", text: "Tag Tasks"
  end

  test "creating a Tag task" do
    visit tag_tasks_url
    click_on "New Tag Task"

    fill_in "Tag", with: @tag_task.tag_id
    fill_in "Task", with: @tag_task.task_id
    click_on "Create Tag task"

    assert_text "Tag task was successfully created"
    click_on "Back"
  end

  test "updating a Tag task" do
    visit tag_tasks_url
    click_on "Edit", match: :first

    fill_in "Tag", with: @tag_task.tag_id
    fill_in "Task", with: @tag_task.task_id
    click_on "Update Tag task"

    assert_text "Tag task was successfully updated"
    click_on "Back"
  end

  test "destroying a Tag task" do
    visit tag_tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tag task was successfully destroyed"
  end
end
