class Snow {
//cette classe permet de gérer facilement la chute des flocons

 Flocon[] neige = new Flocon[30] ; //tableau de flocons
 
 Snow() {
 
    PImage flocon = loadImage("data/snowflake.png"); //pour ne le charger qu'une seule fois pour tous les flocons
    for(int i = 0; i < neige.length; i++) {//crée chaque flocon
       neige[i] = new Flocon(flocon); 
    }
 } 
 void anime() {//les affiche
     for(int i = 0; i < neige.length; i++) {
       neige[i].anime(); 
    }
  }
}