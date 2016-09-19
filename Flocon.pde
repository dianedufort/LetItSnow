class Flocon {
  
  //position
  int x;
  int y;
  
  //mouvement
  int vitesse; //en y
  int balancement; //en x
  
  float miniRotation ; //effet de rotation
  float scale ; //taille
  
  PImage flocon;//png
  
  Flocon(PImage image) {
     y = -30 + int(random(-120,120)); //à -30px (+/-5) dessus de la scène
     x = int(random(0, LetItSnow.LARGEUR));//quelque part le long de la scène
     
     flocon = image;
     
     //arbitraire
     scale = random(0.5,1.25);
     vitesse = int(random(2, 5));
  }
  
  private void dessin() {
     imageMode(CENTER); 
     image(flocon, 0, 0 , scale*flocon.width/2 , scale*flocon.height/2);  
     imageMode(CORNER); //retour à la valeur par défaut
  }
  
  void anime() {
     pushMatrix();
       y += vitesse;//gère le mouvement
       if(y > LetItSnow.HAUTEUR) { //s'il est sorti de la scène, le replacer en haut et à un x aléatoire pour qu'il redescende
          y = -30;
          x = int(random(0, LetItSnow.LARGEUR));
       } 
       translate (x, y);//on se met à l'endroit où dessiner le flocon
       dessin(); //dessin 
     popMatrix(); 
  }
    
}