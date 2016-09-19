class Fleur {
 
 int rayon;
 int nbPetales;
 float angleEcart; // pour le dessin des pétales
 float angle; //angle de rotation en cours
 int rythme; //l'angle en cours est incrémenté
 
 int pX, pY; //position (pour la translation)
 int h, s, b; //teinte, saturation, luminosité

 PImage tige;  
  
 Fleur(){
    rayon = 100; 
    nbPetales = 6;
   
    rythme = 10;//rotation de 10° 30x par secondes.
   
    actualiseFleur(0,0);// initialise les autres infos de la fleur => instructions communes aux fleurs
    //par défaut et aux fleurs personnalisées
 }
  Fleur(int r, int nbP, int ry, int px, int py){
    if(r >= 20) { rayon = r; } else rayon = 20; 
    if(nbP > 3) { nbPetales = nbP; } else nbP = 4; 
    rythme = (ry == 0)?10:ry;
    nbPetales = nbP;
    actualiseFleur(px,py);

 }

 private void dessin(){   
   fill(h,s,b);
    for(int i = 0 ; i < (nbPetales*2) ; i = i+2) {
       bezier(0, 0, rayon*cos((i-1)*angleEcart), rayon*sin((i-1)*angleEcart),rayon*cos((i+2)*angleEcart), rayon*sin((i+2)*angleEcart), 0, 0);
     // triangle(pX,pY, pX+rayon*cos((i)*angleEcart), pY+rayon*sin((i)*angleEcart),pX+rayon*cos((i+1)*angleEcart), pY+rayon*sin((i+1)*angleEcart));
   
    }
    fill(15,100,b);
    ellipse(0,0,rayon/10,rayon/10);
    noFill();
 }
 private void actualiseFleur(int px, int py) {
   //cette fonction exécute des instructions qui sont communes aux deux constructeurs (ou presque). 
   //elle contient notamment tout ce qui est calculé ou généré aléatoirement (angleEcart, angle, hsb, ...)
   pX = px;
   pY = py;  
   angleEcart = TWO_PI/(nbPetales*2);
   angle=0;
   
   h = int(random(3,15));
   s = int(random(80,100));
   b = 100;
   
   tige = loadImage("Tige.png");
   
 }
 private void tige() {
  //cette fonction ajoute une tige à la fleur
  //ratio : on prend le rayon par défaut (100) pour avoir une tige d'échelle 1 
  float ratio = rayon/100.0; 

  //affichage de l'image
  image(tige, int(-ratio*tige.width/2), 0, int(tige.width*ratio) , int(tige.height*ratio));  
  
 }
 void anime() {
   pushMatrix();
      translate (pX, pY);// translation du repère
       tige(); //dessin de la tige ici parce qu'elle tourne pas
  //dessin(); //dessin 
       rotate(radians(angle+=rythme)); //rotation du repère
       dessin(); //dessin 
   popMatrix(); 
 }
}
