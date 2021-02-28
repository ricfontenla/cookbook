puts("Bem vindo ao CookBook, sua rede social de receitas")
puts

INSERIR_RECEITA = 1
VISUALIZAR_RECEITAS = 2
BUSCAR_RECEITA = 3
SAIR = 4

def menu()
  puts("[#{INSERIR_RECEITA}] Para cadastrar uma receita")
  puts("[#{VISUALIZAR_RECEITAS}] Para ver receitas cadastradas")
  puts("[#{BUSCAR_RECEITA}] Para buscar uma receita cadastrada")  
  puts("[#{SAIR}] Para Sair")
  puts
  print ("Escolha uma opção: ")
  return gets.to_i
end

def nova_receita()
  puts("Digite o nome da sua receita: ")
  nome = gets.chomp
  puts
  puts("Digite o tipo da sua receita: ")
  tipo = gets.chomp
  puts
  puts("Receita #{nome} cadastrada com sucesso!")
  return { nome: nome, tipo: tipo }
end

def imprimir_receitas(receitas)
  puts("---------- Receitas cadastradas ----------")
  receitas.each do |receita|
    puts("------------------------------------------")
    receita.each do |nome, tipo|
      puts("#{nome}: #{tipo}")
    end
  end
  if receitas.empty?
    puts('Nenhuma receita cadastrada ):')
  end  
end

def buscar_receitas(receitas, palavra)
  resultado = []
  receitas.each do |receita|
    buscando = ''
    buscando = receita.values.find {|nome| nome.include? palavra}
    if (buscando.nil? == false)
      resultado << receita
    end
  end
  puts("---------- Resultado da Busca ----------")
  resultado.each do |receita|
    puts("----------------------------------------")
    receita.each do |nome, tipo|
      puts("#{nome}: #{tipo}")
    end
  end
  if resultado.empty?
    puts ('Nenhum resultado encontrado')
  end
end


receitas = []
resultado = []

opcao = menu()
puts

loop do
  if (opcao == INSERIR_RECEITA)
    receitas << nova_receita()
  elsif (opcao == VISUALIZAR_RECEITAS)
    imprimir_receitas(receitas)
    puts("------------------------------------------")
  elsif (opcao == BUSCAR_RECEITA)
    print('Informe uma palavra-chave para a busca: ')
    palavra = gets.chomp
    puts
    buscar_receitas(receitas, palavra)
    puts("----------------------------------------")
  elsif (opcao == SAIR)
    break
  else
    puts("Opção Invalida")
  end
  puts
  opcao = menu()
  puts
end

puts("Obrigado por usar o CookBook! Até logo!")
puts