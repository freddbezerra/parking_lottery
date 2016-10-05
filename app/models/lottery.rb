class Lottery < ActiveRecord::Base
    
    has_many :players
    validates_presence_of :initial_date , :final_date , :vacancies
    before_save  :date_initial_cannot_be_greater_than_date_final 
    
    # Ajuste para select Box
    def name_in_collection
        "Data:#{final_date} Vagas:#{vacancies}"
    end
    
    
    #Ajuste para exibição na tabela
    def closed_sim_nao
        if self.closed
            "Sim"
        else
            "Não"
        end
    end
    
    #Não deixa a data inicial ser maior que a final
    def date_initial_cannot_be_greater_than_date_final
         if self.initial_date > self.final_date
             errors.add(:date,"Data inicial não pode ser maior que a data final")
             return false
         end
    end
    
    
    def go
        #Seleciona os Players desta loteria
        array_of_lucky_numbers = Array.new
        players = Player.where(lottery_id: self.id)
        
       #Preenche array para selecionar numeros a serem sorteados
        players.each do |player|
            array_of_lucky_numbers.push(player.lucky_number)
        end
        
        #realiza sorteio
        #guarda os valores sorteados
        array_of_raffled_numbers = Array.new
    
        #realiza a quantidade de sorteios para a quantidade de vagas
        array_of_raffled_numbers = array_of_lucky_numbers.sample(self.vacancies)
        
        #seleciona os jpogadores baseado no seu numero da sorte e nos numeros 
        #sorteados que estão no array raffled_numbers
        players = players.where(lucky_number: array_of_raffled_numbers)
        
       #realizo a alteração após a seleção dos jogadores ganhadores
        players.each do |player|
            player.update(winner: true)
        end
        #retorno os sorteados
        winners = players
        return winners
    end
end
