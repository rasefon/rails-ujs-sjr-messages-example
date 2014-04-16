class Message < ActiveRecord::Base

  default_scope ->{ order(created_at: :desc) }

  def author
    User.find(author_id)
  end

  def author=(user)
    self.author_id = user.id
  end

end
