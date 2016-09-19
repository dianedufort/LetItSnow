class Snow {

 Flocon[] neige = new Flocon[30] ; 
 
 Snow() {
 
    for(int i = 0; i < neige.length; i++) {
       neige[i] = new Flocon(); 
    }
 } 
 void anime() {
     for(int i = 0; i < neige.length; i++) {
       neige[i].anime(); 
    }
  }
}
