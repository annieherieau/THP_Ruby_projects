# 2.4. Programme 3 : 6ème sans ascenseur

# Half pyramide
def half_pyramid(number_of_stages, pattern, step, player)
  pyramid=[]
  if step > number_of_stages then pyramid.push("#{player} #{"🏆​"}".rjust(number_of_stages+12, " ")) end

  step = step_in_pyramid(step, number_of_stages)
  1.upto(number_of_stages) do |stage|
    step == stage ? player_icon = "#{player} " : player_icon = " ".rjust(2, " ")
    pyramid.push((player_icon+(pattern * stage)).rjust(number_of_stages+10, " "))
  end
  return pyramid
end

#step transform to stage of pyramide
def step_in_pyramid(step, number_of_stages)
  return number_of_stages+1-step
end

# start game
def start_game(player)
  puts "🎲​ NEW GAME 🎲".center(38)
  puts "Salut #{player}, tu commences à la marche n° 1"
  puts ""
end

# nouveau joueur
def new_player
player_list = ["🦄​", "🐯​", "😁​"]
return player_list.sample
end

# nouveau pattern
def new_pattern
  pattern_list = ["🔥", "🧊", "🍀"]
  return pattern_list.sample
end


# lancer les dés
def roll_dice
  print "Lance le dé 🎲 (press enter) : "
  gets
  dice = rand(6)+1
  return dice
end

# print dice
def print_dice(dice)
dice_icons = {1 =>"🔴​", 2 => "​​🟣​",  3 =>"​🟣", 4 => "​🟣", 5 => "🟢", 6 =>  "🟢"}
return dice_icons[dice]*dice+"​⚫"*(6-dice)
end

# actions possibles
def gameplay(dice, step)
  # monter 1 marche
  if dice >=5 
    new_step = 1
    info = "👍 Bravo, tu es monté d'une marche !"
  elsif dice ==1
    # descendre 1 marche
    step != 1 ? new_step = - 1 : new_step = 0
    info = "😭​ Dommage, tu es redescendu..."
  else
    # nothing status
    new_step = 0
    info = "😓 Bof, tu ne bouges pas..."
  end
  
  # Affichage
  system("clear")
  puts " \n Tu as fait : #{print_dice(dice)}"
  print info
  return new_step
end

# End Game
def end_game
  puts ""
  puts " 🌟🌟🌟 BRAVO !!! T'ES AU TOP !!! 🌟🌟🌟"
end


def stairway_game
  # variable de départ
  number_of_stages = rand(10)+5 # nombre d'étages
  pattern = new_pattern # motif de la pyramide
  player = new_player # icone du joueur
  step = 1 # marche de départ

  # affiche nouelle partie
  start_game(player)
  # affiche pyramide + joueur
  puts half_pyramid(number_of_stages, pattern, step, player)

  # tours du joueur
  while step.to_i.between?(1,number_of_stages)
    step += gameplay(roll_dice, step)
    puts " Tu es à la marche #{step}."
    puts ""
    puts half_pyramid(number_of_stages, pattern, step, player)
  end
  system ("clear")
  # fin de partie
  end_game
  puts ""
  puts half_pyramid(number_of_stages, pattern, step, player)
  puts ""
end

#______ PERFORM ____
stairway_game