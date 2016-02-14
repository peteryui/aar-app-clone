class DeviseMailer < Devise::Mailer   

  def confirmation_instructions(record, token, opts={})
    opts[:subject] = "Hi, Please confirm yout account"
    @team = record.teams.last
    super
  end

end
