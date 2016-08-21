require 'rails_helper'

RSpec.describe "polls/new", type: :view do
  
  let (:user) {
    FactoryGirl.create(:user)
  }

  before(:each) do
    assign(:poll, Poll.new(
      :title => "MyString",
      :body => "MyText",
      :state => :created,
      :start => "2016-12-31 11:20:01",
      :finish => "2016-12-31 12:20:01",
      :poll_type => 1,
      :user => user
    ))
  end

  it "renders new poll form" do
    render

    assert_select "form[action=?][method=?]", polls_path, "post" do

      assert_select "input#poll_title[name=?]", "poll[title]"

      assert_select "textarea#poll_body[name=?]", "poll[body]"

      assert_select "input#poll_state[name=?]", "poll[state]"

      assert_select "input#poll_type[name=?]", "poll[type]"

      assert_select "input#poll_user_id[name=?]", "poll[user_id]"
    end
  end
end
