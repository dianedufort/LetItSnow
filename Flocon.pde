class Flocon {
  
  int x;
  int y;
  int vitesse;
  int balancement; 
  
  float miniRotation ;
  float scale ; 
  
  PImage flocon;
  
  Flocon() {
     y = -30 + int(random(-120,120)); //à -30px (+/-5) dessus de la scène
     x = int(random(0, LetItSnow.LARGEUR));
     flocon = loadImage("data/snowflake.png");
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
       y += vitesse;
       if(y > LetItSnow.HAUTEUR) { 
          y = -30;
          x = int(random(0, LetItSnow.LARGEUR));
       } 
       translate (x, y);//on se met à l'endroit où dessiner le flocon
       dessin(); //dessin 
     popMatrix(); 
  }
    
}
