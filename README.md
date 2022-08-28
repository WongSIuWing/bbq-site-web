# bbq-site-web

## Framework/technology used 

client side - angular(typescript,html),bootstrap,jquery  
server side - php  
database    - mysql  

## Architecture/Folder explanation
client   - web2  
server   - assignment_web  
database - assignment_web.sql  

## installation - example

### Server installation
download xampp , open and start apache , MySQL  
put assignment_web (server) folder inside /htdocs/  

### Database installation
Open database UI controls with this URL http://localhost/phpmyadmin/index.php?route=/&lang=zh_TW  
Create a new database named : assignment_web  
import and load the assignment_web.sql ,   

### Client installation
right click web2 and open it with visual studio (optional)  
In terminal (make sure current working directory is web2) , type npm install (optional) , npm run ng serve (click url mentioned in terminal to open ) or ng serve -o  
