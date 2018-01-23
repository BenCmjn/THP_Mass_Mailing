require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pp'
require 'pry'
################### Les méthodes de ce programme #############
# Ce qui va suivre est une réaction en chaîne :
# Étape 1 --------------------------------------
def get_all_the_urls_of_alpes_maritimes_townhalls()
  page = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/alpes-maritimes.html"))# On va utiliser Nokogiri pour parcourir la page "val d'oise" de "annuaire-des-mairies.com"
  cityTab = [] # On va créer un 1er tableau à remplir
  page.xpath('//a[@class="lientxt"]').each do |name| # Dans lequel on va mettre les liens (<a>) qu'on utilisera dans la 2e méthode…
    cityTab << name.text
  end
  puts cityTab.length # On va afficher le nombre de villes (pages à scraper)
  get_the_email_of_a_townhal_from_its_webpage(cityTab) # on appelle la prochaine méthode.
  # return cityTab # Le contenu du tableau "cityTab" devient le paramètre de la prochaine méthode.
end
# Étape 2 --------------------------------------
def get_the_email_of_a_townhal_from_its_webpage(cities)
  # on créé un tableau vide a remplir
  emails = [] # Pour chaque ville (récupéré de cities) 
  cities.each do |city|
    url_cities = city.downcase.gsub(' ', '-') # On clean le contenu du tableau précédent, …
    page = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/06/#{url_cities}.html"))  # pour pouvoir l'insérer dans cet url, que Nokogiri va scrapper, une fois de plus
    mail = page.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').text.gsub(' ','')# et on récupère les <p> contenant des "@" puisque un email est forcément avec un "@" ;)
    emails << mail# On remplit le tableau qu'on a créé au début de cette méthode
  end
  return emails # On sort de cette méthode le conte nu du tableau
end
##################### Fin des méthodes #######################
##################### Début du proramme ######################
# On va stocker dans des variables ce que nos méthodes nous sortent :
cities = get_all_the_urls_of_alpes_maritimes_townhalls()
mailing_list = get_the_email_of_a_townhal_from_its_webpage(cities)

# binding.pry
# GOGOGOGO ! Lancer cette méthode va lancer la deuxième (me demandez pas comment, je penseais avoir commenté ça)
get_all_the_urls_of_alpes_maritimes_townhalls()

hash_cities = cities.zip(mailing_list).to_h # Crée le hash des deux tableaux créés
pp hash_cities # affiche proprement ce hash


File.open("cities_hashed.json","w") do |f| # créer ou remplacer le .json ("w" pour "write")  
  f.write(JSON.pretty_generate(hash_cities)) # ".pretty_generate" va générer une ligne clé => Valeur dans le json… je pense
end

##################### Fin du programme #####################














