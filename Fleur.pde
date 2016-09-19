class Fleur {
 
 int rayon; //de la fleur
 int nbPetales; 
 float angleEcart; // pour le dessin des pétales
 float angle; //angle de rotation en cours
 int rythme; //l'angle en cours est incrémenté
 
 int pX, pY; //position (pour la translation)
 int h, s, b; //teinte, saturation, luminosité

 PImage tige;  
  
 //constructeur par défaut
 Fleur(){
    rayon = 100; 
    nbPetales = 6;
   
    rythme = 10;//rotation de 10° 30x par secondes.
   
    actualiseFleur(0,0);// initialise les autres infos de la fleur => instructions communes aux fleurs
    //par défaut et aux fleurs personnalisées
       
   //ajoute la tige
   tige = loadImage("Tige.png");
 }
 
 //constructeur 
 Fleur(int r, int nbP, int ry, int px, int py, PImage nvtige){
   
    if(r >= 20) { rayon = r; } else rayon = 20; //pour éviter que le rayon soit trop petit
    if(nbP > 3) { nbPetales = nbP; } else nbP = 4;  //gère le minimum de pétales
    rythme = (ry == 0)?10:ry; 
    nbPetales = nbP;
    
    tige = nvtige;
    
    actualiseFleur(px,py);

 }

 private void dessin(){   
   fill(h,s,b);//choix de la couleur
   
    for(int i = 0 ; i < (nbPetales*2) ; i = i+2) {
       bezier(0, 0, rayon*cos((i-1)*angleEcart), rayon*sin((i-1)*angleEcart),rayon*cos((i+2)*angleEcart), rayon*sin((i+2)*angleEcart), 0, 0);
     // triangle(pX,pY, pX+rayon*cos((i)*angleEcart), pY+rayon*sin((i)*angleEcart),pX+rayon*cos((i+1)*angleEcart), pY+rayon*sin((i+1)*angleEcart));
   
    }
    fill(15,100,b);//couleur du centre de la fleur
    ellipse(0,0,rayon/10,rayon/10);//dessin
    noFill();
 }
 
 private void actualiseFleur(int px, int py) {
   //cette fonction exécute des instructions qui sont communes aux deux constructeurs (ou presque). 
   //elle contient notamment tout ce qui est calculé ou généré aléatoirement (angleEcart, angle, hsb, ...)
   pX = px;
   pY = py;  
   angleEcart = TWO_PI/(nbPetales*2);
   angle=0;
   
   //gère la teinte, la saturation et la luminosité de la fleur de manière à avoir une fleur dans les teintes orangées et assez saturées
   h = int(random(3,15));
   s = int(random(80,100));
   b = 100;

   
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