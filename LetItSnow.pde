static final int LARGEUR = 1024;
static final int HAUTEUR = 576;
final int MAXFLEURS = 30;

Fleur[] tabFleurs = new Fleur[MAXFLEURS];
int nbFleurs = 0;

PImage imgEte;
PImage imgHiver;

//FLOU
PShape fonduNoir;
int alphaFondu = 0;
int ecartFlou = 4;
boolean fondu = false;
boolean ete = true;

Snow s;
int frameCountDepart = 0; //la frame à laquelle on a débuté le retrait des fleurs
  
void setup() {//fonction d'initialisation de la scène
  size(LARGEUR, HAUTEUR, P2D); 
  ellipseMode(RADIUS);//au lieu d'utiliser (x,y, largeur, hauteur) on a (x,y, moitiéLargeur, moitiéHauteur)
  colorMode(HSB, 100);//mode TSL au lieu de RVB
 
  imgEte = loadImage("data/9178790558_ccb2c32eb6_k.jpg");//mon fond est chargé
  imgHiver = loadImage("data/4333393031_044f34201e_b.jpg");//mon fond est chargé
  
  imgEte.resize(LARGEUR, HAUTEUR);//pas trop de déformation
  
  frameRate(24); //frameRate diminué de moitié
    
  fonduNoir = createShape(RECT, 0, 0, width, height);
  fonduNoir.setStroke(false);

}
void draw() {
  
   dessineFondScene(); 
   
   if(fondu) dessineFondu();  

}

void dessineFondScene() {
  if(ete) { 
      image(imgEte, 0, 0); //renouvellement de l'image à chaque Frame
      for(int i=0; i<nbFleurs; i++) {//dessin des fleurs dans un tableau
          tabFleurs[i].anime(); 
      }   
  }
  else { 
    image(imgHiver, 0, 0); //renouvellement de l'image à chaque Frame
     if(!fondu) {
      //let it snow !!! 
      s.anime();
   }
  }
}
void dessineFondu() { 
     int coeff = ete?1:-1;
     alphaFondu = floor(alphaFondu + (coeff * ecartFlou));
     fonduNoir.setFill(color(0, alphaFondu));//noir, full opacité 
     shape(fonduNoir);
     
     if(alphaFondu >= 100) ete = false; //fondu au max 
     else if(alphaFondu <= 0) {
         fondu = false;//on désactive
         frameCountDepart = frameCount ; //on commence le compte à rebours qui enlève les fleurs
     }
       
}
void mousePressed() {
 
  if(ete && !fondu) { //si c'est l'été et que le fondu est désactivé 
    if(nbFleurs < MAXFLEURS) //dessin fleur 
      tabFleurs[nbFleurs++] = new Fleur(int(random(30,150)), int(random(4,20)), int(random(-15,15)), mouseX, mouseY);   
    else {//si max atteint
      fondu = true;//déclenche fondu   
      s = new Snow(); //on déclenche la neige
    }
    
  }//si on arrive ici, c'est l'hiver ou fondu activé

}  

void keyPressed() {
   if (key ==  's') {
     save("data/capture_" + int(random(999999)) + ".jpg");
     println("Capture d'écran effectuée");
   }
   else if(key ==  'c'){
     ete = true;
     image(imgEte, 0, 0); //renouvellement de l'image 
     nbFleurs = 0; 
   }
}
