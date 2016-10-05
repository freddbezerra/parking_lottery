class Player < ActiveRecord::Base
    belongs_to :lottery
    validates :email, uniqueness:{scope: :email , message: "já registrado"} , presence: true
    before_save  :generate_lucky_number #     , :adjust_email 

    
    def adjust_email
         if Player.where(email: self.email).exists?
            
              return true 
         else
              if self.email.include? ".com" or  self.email.include? "@"
                    errors.add(:date,"digite apenas o texto antes do @ no campo de email !")
                    return false
             else
                    append = '@belezanatural.com.br'
                    self.email = (self.email + append).gsub(/\s+/, "")
                    return true
             end
         end
    end
    
    def generate_lucky_number
        
        # instanciando novo array
        array_of_lucky_numbers = Array.new
        
        #ramdomizando o novo numero da sorte
        new_lucky_number = rand(100..1000) 
        
        #Buscando todos os lucky numbers participantes deste sorteio
        players = Player.where(lottery_id: self.lottery_id)
        
        #iterando nos players e coletando seus lucky_numbers
        players.each do |player|
            array_of_lucky_numbers.push(player.lucky_number)
        end
        
        #verifica se o numero ramdomizado é igual a algum 
        #numero no array_of_lucky_numbers
        while array_of_lucky_numbers.include? new_lucky_number do
            puts "numero já existe #{new_lucky_number} "
            new_lucky_number = rand(100..1000) 
        end
        #realiza salvamento do lucky number
        self.lucky_number = new_lucky_number
        return true
       
    end
end
