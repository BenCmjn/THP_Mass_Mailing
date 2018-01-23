require 'pry' # Au cas où
require 'pp' # Au cas où
require 'gmail' #Gem Gmail : https://github.com/gmailgem/gmail
require "google_drive"
require_relative 'log' # Pour pas mettre ses logs dans ce fichier.
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#!! POUR LA PROCHAINE LIGNE, VOUS DEVEZ AVOIR VOTRE FICHIER "config.json" DANS LE DOSSIER DE CE FICHIER
session = GoogleDrive::Session.from_config("config.json") # Créons une session Google Drive
my_sheet = session.spreadsheet_by_key("12VvLs5ia0nsx9H00_MwkGbxM6DH7eDlCt1H3icS9umM").worksheets[0] # première feuille de https://docs.google.com/spreadsheets/d/12VvLs5ia0nsx9H00_MwkGbxM6DH7eDlCt1H3icS9umM/edit#gid=0
#!! POUR LA PROCHAINE LIGNE, VOUS DEVEZ AVOIR UN FICHIER "log.rb" DANS LE DOSSIER DE CE FICHIER
gmail = Gmail.connect(USERNAME, PASSWORD) # Connexion

# puts gmail.inbox.count # compte dans la boite de reception

#################################### Méthodes #####################
def send_email_to_line

end


#############################Fin des Méthodes #####################
########################## START ##################################
# On créé un tableau de récepteurs de mon email
recepteurs = ["alice.thp@yopmail.com","bob.thp@yopmail.com","carole.thp@yopmail.com"]
# On créé un tableau de noms de récepteurs
nom_recep = ["Alice","Bob","Carole"]
# On créé un HASH de récepteurs de mon email
h_recep = recepteurs.zip(nom_recep).to_h # Crée le hash des deux tableaux créés
# pp h_recep # affiche proprement ce hash
(1..185).each { |rangée| 
  nom = my_sheet [rangée, 1]
  adresse = my_sheet [rangée, 2]

  bonjour = gmail.compose do
    to adresse
    subject "On s'amuse bien à #{nom}!"
    body "Cher mairie de #{nom}, \n
	Je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau. La formation s'appelle The Hacking Project (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes.
	\n Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.
	\n Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à #{nom}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec #{nom} !
	\n Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"
  end
  gmail.deliver(bonjour) # On envoie le mail. On aurait aussi pu écrire "bonjour.deliver!"
  puts "email envoyé à #{adresse}"
  sleep(5) #repose toi 5 sec
} # Fin de la boucle



=begin
h_recep.each do |email,nom|
  bonjour = gmail.compose do
    to email
    subject "Having fun à THP #{nom}!"
    body "Cher #{nom}, \n Je suis très contents que tu lise ce mail…"
  end
  gmail.deliver(bonjour) # bonjour.deliver!
end

puts "les #{h_recep.length} emails ont été envoyés"
gmail.logout
=end

#############################Fin du programme #####################
