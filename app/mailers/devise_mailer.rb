class DeviseMailer < Devise::Mailer   

  def confirmation_instructions(record, token, opts={})
    headers = {
        :subject => "Hi, #{@record.name}, Please confirm yout account"
    }
    @team = record.teams.last
    super
  end

end
