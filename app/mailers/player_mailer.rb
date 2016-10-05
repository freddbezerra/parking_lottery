class PlayerMailer < ApplicationMailer
    default from: 'notifications@example.com'
    
    def lottery_mail(player)
        @player = player
        @url = "http://example.com/login"
        mail(to: @player.email, subject: 'Boa Sorte!')
        
    end
end
