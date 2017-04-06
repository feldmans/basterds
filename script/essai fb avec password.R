install.packages("Rfacebook")
library(Rfacebook)

 #PACKAGE DATA MINING
 #https://github.com/juliasilge/tidytext


#GUIDE D'UTILISATION DE R POUR IMPORTER FACEBOOK
#http://analyticsastra.com/complete-guide-facebook-data-mining-using-r/
#http://thinktostart.com/analyzing-us-elections-facebook-r/
#https://bigdataenthusiast.wordpress.com/2016/03/19/mining-facebook-data-using-r-facebook-api/
#http://pablobarbera.com/blog/archives/3.html


# https://startssl.com/StartAPI/Docs#Domainvalidation

#get app_id et app_secret at this adress:
#https://developers.facebook.com/apps/1145902798800625/settings/
#click show app secret to have a new one. You will have to enter your fb pwd (clue : same as work computer) 
fb_oauth <- fbOAuth(app_id="..........", app_secret="................")
save(fb_oauth, file="fb_oauth")
load("fb_oauth")
#https://developers.facebook.com/tools/explorer/  à renouveler
at = "EAACEdEose0cBABYbOvOATCEeVFW44ySHCDCWMelTUtgcXXFZCfzqTnApoQHGbH8ahjYCxlyFLFpZCFCgqTLQso3D9XSpCWbLhWikbZCFsLGN69ZB65Wvn58ExVcvbZBpkbuCO0CyDFFzvNB8daSlZClYYjVGJyojEZAZBZAw1iCIXKgZDZD" 

me <- getUsers("me", token=fb_oauth)

#recherche groupe
ids <- searchGroup(name="boycott_desinvestissement", token=fb_oauth) 
ids <- searchGroup(name="boycott", token=fb_oauth) 
View(ids)
#voir les postes du groupe
group <- getGroup(group_id=742067835884985, token=at)
View(group)

#recherche page
pages <- searchPages( string="boycott desinvestissement sanction", token=fb_oauth, n=100 )
View(pages)
#Voir les posts sur une page et voir le nombre de commentaires
fb_page  <- getPage(page=247567411923496, token=fb_oauth, feed=TRUE)
View(fb_page)
#voir les commentaires
post <- getPost(post=fb_page$id[9], n=2000, token=fb_oauth) 
View(post$comments)
