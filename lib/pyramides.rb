# PYRAMIDES

#______Methodes _______

# demander le nombre de lignes
def ask_number_of_lines
  number_of_lines = 0
  # controler que user_number est dans [1;25]
  while number_of_lines < 1 || number_of_lines > 25
    print "Combien d'étages veux-tu ? (entre 1 et 25) "
    number_of_lines = gets.chomp.to_i
  end
return number_of_lines
end

# demander le type de pyramide 1, 2 ou 3
def ask_pyramid_type
  pyramid_type=0
  puts "Quelle pyramide veux-tu ?"
  while pyramid_type < 1 || pyramid_type > 3
    print "Half [1], Gizet [2] ou Alexandrie [3] > "
    pyramid_type = gets.chomp.to_i
  end
return pyramid_type
end

# demander le motif de caractère(s)
def ask_pyramid_pattern
  pattern=""
  puts "Quel motif veux-tu ?"
  print "Entre le(s) caractère(s) de ton choix : "
  pattern = gets.chomp
  
  # patterne par défaut si vide ou espace
  pattern=="" || pattern== " "? pattern ="." : pattern

  return pattern
end

# Pyramide 1- Half
def half_pyramid(number_of_lines, pattern)
  pyramid=[]
  1.upto(number_of_lines) do |etage|
    pyramid.push(pattern * etage)
  end
  return pyramid
end

# Pyramide 2- Gizet
def gizet_pyramid(number_of_lines, pattern)
  pyramid=[]
  nb_caract = 1
  
  for etage in 1..number_of_lines
  line=""
  for caract in 1..nb_caract
    line += pattern
  end
  # formater sur x caractère (padding centré)
  pyramid.push("#{line.center(number_of_lines*2, " ")}")
  nb_caract +=2
end
  return pyramid
end

# Pyramide 3- Alexandria
def alex_pyramid(number_of_lines, pattern)
  pyramid=[]
  #Avertissement si nombre_of_lines paire + modification 
  if number_of_lines.even?
    puts "NB : En raisons des normes de sécurités, nous avons enlever un étage à ta pyramide !\n"
    # impaire en enlevant 1 ligne
    number_of_lines -=1
  end

  #reprend la pyramide 2- Gizet et la renverse en enlevant 1 étage
  top = gizet_pyramid(number_of_lines/2, pattern) 
  bottom = top.reverse
  bottom.shift # retrait du prier élément
  pyramid = top.concat(bottom) # concaténation des 2 tableaux

  return pyramid
end

# Construire la pyramide
def select_pyramid(number_of_lines, pyramid_type, pattern)

  # choix de la pyramide
  case pyramid_type
  when 1
    pyramid = half_pyramid(number_of_lines, pattern)
  when 2
    pyramid = gizet_pyramid(number_of_lines, pattern)
  when 3
    pyramid = alex_pyramid(number_of_lines, pattern)
  else
    puts '...'
  end
  return pyramid
end

# Affichage de la pyramide
def build_pyramid()
  puts "*** Salut, bienvenue dans ma super pyramide ! ***\n\n"
  # User inputs
  number_of_lines = ask_number_of_lines
  pyramid_type = ask_pyramid_type
  pyramid_pattern = ask_pyramid_pattern
  
  # création de la pyramide
  pyramid = select_pyramid(number_of_lines, pyramid_type, pyramid_pattern)
  
  # affichage
  pyramid_type==3 && number_of_lines.even? ? note = "(presque)" : note=""
  puts "Voici la Pyramide #{note} de tes rêves : "
  puts pyramid
end

##________ PERFORM _______
build_pyramid()


