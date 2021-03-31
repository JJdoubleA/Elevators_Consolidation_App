class Firstletter 

    attr_reader :name
    attr_reader :customers

    def name 
        "farrah"
    end
    def create
        @customers = Customer.new
        @customers.full_name_of_company_contact = params [:full_name_of_company_contact]

        @cusrtomers.save
    end


    def letter
        name = "farrah"
        name.split.map(&:first)
    end

    
end