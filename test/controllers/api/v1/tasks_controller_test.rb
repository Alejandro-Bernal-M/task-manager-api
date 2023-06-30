require "test_helper"

class Api::V1::TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_task = api_v1_tasks(:one)
  end

  test "should get index" do
    get api_v1_tasks_url, as: :json
    assert_response :success
  end

  test "should create api_v1_task" do
    assert_difference("Api::V1::Task.count") do
      post api_v1_tasks_url, params: { api_v1_task: { content: @api_v1_task.content, title: @api_v1_task.title } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_task" do
    get api_v1_task_url(@api_v1_task), as: :json
    assert_response :success
  end

  test "should update api_v1_task" do
    patch api_v1_task_url(@api_v1_task), params: { api_v1_task: { content: @api_v1_task.content, title: @api_v1_task.title } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_task" do
    assert_difference("Api::V1::Task.count", -1) do
      delete api_v1_task_url(@api_v1_task), as: :json
    end

    assert_response :no_content
  end
end
