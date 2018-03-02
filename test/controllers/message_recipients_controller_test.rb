require 'test_helper'

class MessageRecipientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_recipient = message_recipients(:one)
  end

  test "should get index" do
    get message_recipients_url
    assert_response :success
  end

  test "should get new" do
    get new_message_recipient_url
    assert_response :success
  end

  test "should create message_recipient" do
    assert_difference('MessageRecipient.count') do
      post message_recipients_url, params: { message_recipient: { message_id: @message_recipient.message_id, recipient_group_id: @message_recipient.recipient_group_id, recipient_id: @message_recipient.recipient_id } }
    end

    assert_redirected_to message_recipient_url(MessageRecipient.last)
  end

  test "should show message_recipient" do
    get message_recipient_url(@message_recipient)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_recipient_url(@message_recipient)
    assert_response :success
  end

  test "should update message_recipient" do
    patch message_recipient_url(@message_recipient), params: { message_recipient: { message_id: @message_recipient.message_id, recipient_group_id: @message_recipient.recipient_group_id, recipient_id: @message_recipient.recipient_id } }
    assert_redirected_to message_recipient_url(@message_recipient)
  end

  test "should destroy message_recipient" do
    assert_difference('MessageRecipient.count', -1) do
      delete message_recipient_url(@message_recipient)
    end

    assert_redirected_to message_recipients_url
  end
end
