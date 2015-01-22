class UserFriendshipsDecorator < Draper::Decorator
  decorates :user_friendship
  delegate_all

  def friendship_state
    model.state.titleize
  end

  def sub_message
    case model.state
    when 'pending'
      "Friend request pending."
    when 'accepted'
      "You are friends with #{model.friend.first_name}."
    end
  end

  def update_action_verbiage
    case model.state
    when 'pending'
      'Delete'
    when 'requested'
      'Accept'
    when 'accepted'
      'Update'
    when 'blocked'
      'Unblock'
    end
  end
end
