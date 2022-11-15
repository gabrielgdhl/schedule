@agenda = [
    {nome: "Gabriel", telefone: "92999585522"},
    {nome: "Daniele", telefone: "80000000000"},
]

def allContacts
    puts "--------------------------------"
    @agenda.each do |contato|
        puts "#{contato[:nome]}  -> #{contato[:telefone]}"
    end
    puts "-------------------------------"
end

def addContact
    puts ""
    puts "-------------------------------"
    print "nome: "
    nome = gets.chomp
    print "Telefone: "
    telefone = gets.chomp
    puts "-------------------------------"
    puts ""

    @agenda << {nome: nome, telefone: telefone}
end

def vieweContact
    print "Qual contato você deseja: "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase == (nome.downcase)
            puts "-------------------------------"
            puts "#{contato[:nome]} - #{contato[:telefone]}"
            puts "-------------------------------"
        end
    end
end

def updateContact
    print "Qual contato você deseja editar: "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase == (nome.downcase)
            print "Editar nome (Put enter if you don't want update the contact name): "
            name_left = contato[:nome]

            contato[:nome] = gets.chomp
            contato[:nome] = contato[:nome].empty? ? name_left : contato[:nome]

            print "Editar telefone (Put enter if you don't want update the contact phone number): "
            phone_left = contato[:telefone]

            contato[:telefone] = gets.chomp
            contato[:telefone] = contato[:telefone].empty? ? phone_left : contato[:telefone]

            puts "Your informations was updated"
        end
        print "Contact not found!"
    end
end

def deleteContact
    print "Qual contato você deseja deletar: "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase == (nome.downcase)
            index = @agenda.index(contato)
            @agenda.delete_at(index)
            break
        end
    end
end

loop do
    puts " 1 - Contatos\n 2 - Adicionar Contato\n 3 - Ver Contato\n 4 - Editar Contato\n 5 - Remover Contato\n 0 - Sair\n"
    codigo = gets.chomp.to_i

    case
    when codigo == 0
        puts ""
        puts "-------------------------------"
        puts "|||||||| Até mais! ||||||||||||"
        puts "-------------------------------"
        puts ""
        break
    when codigo == 1
        allContacts
    when codigo == 2
        addContact
    when codigo == 3
        vieweContact
    when codigo == 4
        updateContact
    when codigo == 5
        deleteContact
    else
        puts "Function don't exists!"
    end
end