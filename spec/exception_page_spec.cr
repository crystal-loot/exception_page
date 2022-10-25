require "./spec_helper"

describe ExceptionPage do
  it "allows debugging the exception page" do
    flow = ErrorDebuggingFlow.new

    flow.view_error_page
    flow.should_have_information_for_debugging
    flow.show_all_frames
    flow.should_be_able_to_view_other_frames
  end
end

class ErrorDebuggingFlow < LuckyFlow
  def view_error_page
    visit "/"
  end

  def should_have_information_for_debugging
    should have_element("@exception-title", text: "Something went very wrong")
    should have_element("@code-frames", text: "test_server.cr")
    click("@see-raw-error-message")
    should have_element("@raw-error-message")
  end

  def show_all_frames
    el("@show-all-frames").click
  end

  def should_be_able_to_view_other_frames
    should have_element("@code-frame-summary", text: "->")
  end
end
