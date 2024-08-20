//Variaveis
PImage parede,chao,kanye,tanjiro,juuzou,gato,jungkook;
float zoom = 1;
float mouse = 0.05; 
float rodarX = 0;
float rodarY = 0;
float offsetX, offsetY;
float x = 0; // variavel usada para iluminação e movimento do teclado no eixo x
float y = 0; // movimento do eixo y (teclado)
float z = 0; // movimento do eixo z (teclado)
int tubos = 10; // essa variavel vai definir em quantas partes o cilindro vai ser dividido
// os vetores vão guardar as coordenadas do X e Y
float[] tuboY = new float[tubos];
float[] tuboX = new float[tubos];


void setup() {
  size(1000, 800, P3D); 
  //imagens escolhidas para galeria!!
  parede = loadImage("parede.jpg"); 
  chao = loadImage("chao.jpg");
  kanye = loadImage("kanye.jpg");
  tanjiro = loadImage("tanjiro.jpg");
  juuzou = loadImage("juuzou.jpg");
  gato = loadImage("gato.jpg");
  jungkook = loadImage("jungkook.jpg");
   // calculo que foi usado para fazer o 3D do cilindro, 400 é o valor do angulo total do cilindro
  float angulo = 400/tubos;
  for(int i = 0; i < tubos;i++){
  tuboX[i] = cos(radians(i*angulo));
  tuboY[i] = sin(radians(i*angulo));
 }
}

void draw() {
 background(0); // cor do fundo preto(0)
  translate(width / 2, height / 2, 0); // centralizar o ponto que a tela começa
  scale(zoom); // aplicação do zoom
  rotateX(rodarX); // roda no eixo x
  rotateY(rodarY); // roda no eixo y
  translate(x,y,z); // move a galeria no teclado (Teclas que movem: A,W,S,D,Q,E)
  
  // para definir a iluminação assim como o foco de luz
  ambientLight(147, 112, 219);
  spotLight(20, 20, 200, width - x, height, 200, 0, -1, 0, PI / 2, 1);
  spotLight(20, 200, 20, 0 + x, 0, 200, 0, 1, 0, PI / 2, 1);
  spotLight(200, 20, 20, 0 + x, height, 200, 1, 0, 0, PI / 2, 1);
  
//Fazendo primeiro o chão texturizado
  pushMatrix();
  translate(0, 250, 0);
  rotateX(HALF_PI);
  beginShape(); // esse método define a formação de qualquer forma
  texture(chao);
  // o vertex define os vertices do chao e com a textura
  vertex(-1200, -300, 0, 0);
  vertex(1200, -300, chao.width, 0);
  vertex(1200, 300, chao.width, chao.height);
  vertex(-1200, 300, 0, chao.height);
  endShape(); // esse método é usado para finalizar depois que a forma ta feita
  popMatrix();
  
  // Parede texturizada conectada ao chão
  pushMatrix();
  translate(0, 0, -300);
  beginShape();
  texture(parede); // imagem escolhida para ficar na parede
  vertex(-1200, -250, 0, 0); // define o vertice da parede e em cada vertice temos que colocar a imagem
  vertex(1200, -250, parede.width, 0);
  vertex(1200, 250, parede.width, parede.height);
  vertex(-1200, 250, 0, parede.height);
  endShape();
  popMatrix();
  //Nome
 String a3= "A3: Chiara da Costa Pedrico - 1262221463;
textAlign(CENTER, CENTER); // define que o alinhamento do texto é no centro
fill(255); // cor branca
textSize(30); // escolha do tamanho foi 30 para ficar visivel o nome 
text(a3, -450, -200, -295);  // posição do texto que está na parede

  // Esfera Simples
  pushMatrix();
  translate(-150, 100, -150); //posição da esfera
  rotateY(frameCount * 0.05); // rotação no eixo y
  rotateX(frameCount * 0.01); // rotação no eixo x
  fill(128); // cor roxa
  stroke(255); // cor das linhas da esfera
  sphere(80); // esfera com 70 pixels
  popMatrix();

  //Nome
 String esfera = "Esfera";
textAlign(CENTER, CENTER); // alinhamento do texto
fill(255); // cor 
textSize(25); // tamanho da letra
text(esfera, -150, -50, -150); //posição do nome da esfera
 
 //Cubo simples
  pushMatrix();
  translate(-1000, 100, -150);  //posição do cubo
  rotateX(frameCount * 0.03); // roda no eixo x
  rotateY(frameCount * 0.05); // roda no eixo y
  fill(255,127,80); // cor coral
  noStroke(); // tira as linhas marcadas do cubo
  box(126); // desenha o cubo com 100 pixels
  popMatrix();
  
  //Nome 
String cubo = "Cubo";
textAlign(CENTER, CENTER); // alinhamento do texto
fill(255); // cor
textSize(25); // tamanho
text(cubo, -1000, -50, -150);  // posição do texto

 //Piramide Azul
  pushMatrix();
  fill(224,255,255);
  translate(90, 100,-150); // posição da piramide
  rotateY(frameCount * 0.05); // roda no eixo y
  rotateX(frameCount * 0.01); // roda no eixo x

// formação da base e lado da piramide
//base
  beginShape();
  vertex(-100/2, -100/2, -100/2);
  vertex(100/2, -100/2, -100/2);
  vertex(100/2, 100/2, -100/2);
  vertex(-100/2, 100/2, -100/2);
  endShape(CLOSE);
//primeiro lado
  beginShape();
  vertex(0, 0, 100);
  vertex(-100/2, -100/2, -100/2);
  vertex(100/2, -100/2, -100/2);
  endShape(CLOSE);
//segundo lado
  beginShape();
  vertex(0, 0, 100);
  vertex(100/2, -100/2, -100/2);
  vertex(100/2, 100/2, -100/2);
  endShape(CLOSE);
//terceiro lado
  beginShape();
  vertex(0, 0, 100);
  vertex(100/2, 100/2, -100/2);
  vertex(-100/2,100/2, -100/2);
  endShape(CLOSE);
// quarto lado
  beginShape();
  vertex(0, 0, 100);
  vertex(-100/2, 100/2, -100/2);
  vertex(-100/2, -100/2, -100/2);
  endShape(CLOSE);
  popMatrix();
  
  // Nome
 String piramide = "Pirâmide";
textAlign(CENTER, CENTER); // alinhamento do texto
fill(255); // cor
textSize(25); // tamanho do texto
text(piramide, 100, -50, -150);  // posição do texto
  
 //Esfera texturizada
  pushMatrix();
  beginShape(QUAD_STRIP); // o QUAD_STRIP usa algumas tiras de um quadrilatero
  int parte= 200; // define o numero de partes que a esfera terá
  texture(gato); // imagem escolhida para esfera
  translate(300, 100,-150); // posição da esfera na galeria 
  rotateY(frameCount * 0.03); // rotaciona a esfera no y
  rotateX(frameCount * 0.03); // rotaciona a esfera no x

// for que percorre as latitudes da esfera
  for (int i = 0; i <= parte; i++) {
    float lat0 = map(i, 0, parte, -HALF_PI, HALF_PI); // faz a conta da latitude atual
    float lat1 = map(i+1, 0, parte, -HALF_PI, HALF_PI); // faz a conta da proxima latitude
   // for que percorre a longitude 
    for (int j = 0; j <= parte; j++) {
      float lon = map(j, 0, parte, -PI, PI); // calculo da longitude
      float x = cos(lon) * cos(lat1); // calculo da coordenada x
      float y = sin(lon) * cos(lat1); // calculo da coordenada y
      float z = sin(lat1);  // calculo da coordenada z
      vertex(x * 70, y * 70, z * 70, j * (1.0 / parte) * gato.width, i * (1.0 / parte) * gato.height);
      x = cos(lon) * cos(lat0); // calculo coordenada x
      y = sin(lon) * cos(lat0); // calculo coordenada y
      z = sin(lat0); // calculo coordenada z
      // vertices da esfera
      vertex(x * 70, y * 70, z * 70, j * (1.0 / parte) * gato.width, (i+1) * (1.0 / parte) * gato.height);
    }
  }
  endShape();
  popMatrix();
  //Nome
 String esferaGato = "Esfera texturizada";
textAlign(CENTER, CENTER);
fill(255); // cor
textSize(25); // tamanho da letra
text(esferaGato, 300, -50, -150); // posição do texto
  
  //Cubo texturizado
  pushMatrix();
  beginShape(QUADS);
  texture(juuzou); // imagem escolhida para ser texturizada
  translate(-600, 100, -150);  // posição do cubo
  rotateX(frameCount * 0.01); // roda no eixo x
  rotateY(frameCount * 0.01); // roda no eixo y
  // definindo o tamanho de cada lado e aplicando a imagem
  //frente
  vertex(-50, -50, 50, 0, 0); 
  vertex(50, -50, 50, juuzou.width, 0); 
  vertex(50, 50, 50, juuzou.width, juuzou.height); 
  vertex(-50, 50, 50, 0, juuzou.height); 
  //traseira
  vertex(50, -50, -50, 0, 0);
  vertex(-50, -50, -50, juuzou.width, 0); 
  vertex(-50, 50, -50, juuzou.width, juuzou.height);
  vertex(50, 50, -50, 0, juuzou.height); 
  //parte de cima
  vertex(-50, -50, 50, 0, 0);
  vertex(50, -50, 50, juuzou.width, 0); 
  vertex(50, -50, -50, juuzou.width, juuzou.height); 
  vertex(-50, -50, -50, 0, juuzou.height);
  //parte de baixo
  vertex(-50, 50, 50, 0, 0);
  vertex(50, 50, 50, juuzou.width, 0);
  vertex(50, 50, -50, juuzou.width, juuzou.height); 
  vertex(-50, 50, -50, 0, juuzou.height); 
 //lado esquerdo
  vertex(-50, -50, 50, 0, 0);
  vertex(-50, -50, -50, juuzou.width, 0); 
  vertex(-50, 50, -50, juuzou.width, juuzou.height); 
  vertex(-50, 50, 50, 0, juuzou.height);
 // lado direito
  vertex(50, -50, 50, 0, 0); 
  vertex(50, -50, -50, juuzou.width, 0); 
  vertex(50, 50, -50, juuzou.width, juuzou.height);
  vertex(50, 50, 50, 0, juuzou.height); 
  endShape();
  popMatrix();
  
 //Nome
String cuboTx = "Cubo Texturizado";
textAlign(CENTER, CENTER); // alinhamento do texto
fill(255); // cor branca
textSize(25); // tamanho do texto
text(cuboTx, -600, -50, -150); //posição do texto


 // Retangulo texturizado(foi colocado para rodar em sentido X para ficar visivel a imagem)
  pushMatrix();
  beginShape(QUADS);
  texture(tanjiro); // textura do retangulo
  translate(-350, 100, -150); //posição 
  rotateX(frameCount * 0.01); // roda no x
  // Fazendo todos os lados assim como as outras formas de textura e 3D
  //frente
  vertex(-75, -45, 100, 0, 0);
  vertex(75, -45, 100, tanjiro.width, 0); 
  vertex(75, 45, 100, tanjiro.width, tanjiro.height); 
  vertex(-75, 45, 100, 0, tanjiro.height); 
  //atrás
  vertex(75, -45, -100, 0, 0); 
  vertex(-75, -45, -100, tanjiro.width, 0);
  vertex(-75, 45, -100, tanjiro.width, tanjiro.height); 
  vertex(75, 45, -100, 0, tanjiro.height); 
 //parte de cima
  vertex(-75, -45, 100, 0, 0); 
  vertex(75, -45, 100, tanjiro.width, 0);
  vertex(75, -45, -100, tanjiro.width, tanjiro.height); 
  vertex(-75, -45, -100, 0, tanjiro.height); 
 //parte de baixo
  vertex(-75, 45, 100, 0, 0);
  vertex(75, 45, 100, tanjiro.width, 0); 
  vertex(75, 45, -100, tanjiro.width, tanjiro.height); 
  vertex(-75, 45, -100, 0, tanjiro.height); 
 //lado esquerdo
  vertex(-75, -45, 100, 0, 0); 
  vertex(-75, -45, -100, tanjiro.width, 0); 
  vertex(-75, 45, -100, tanjiro.width, tanjiro.height); 
  vertex(-75, 45, 100, 0, tanjiro.height); 
 //lado direito
  vertex(75, -45, 100, 0, 0); 
  vertex(75, -45, -100, tanjiro.width, 0); 
  vertex(75, 45, -100, tanjiro.width, tanjiro.height); 
  vertex(75, 45, 100, 0, tanjiro.height); 
  endShape();
  popMatrix();
  //Nome
String retangulo = "Retangulo";
textAlign(CENTER, CENTER);
fill(255); //cor
textSize(25); // tamanho do texto
text(retangulo, -350, -50, -150); //posicao do texto
  
  // Cilindro texturizado
  pushMatrix();
  beginShape(QUAD_STRIP);
  texture(kanye); // textura
  translate(-800, 100, -150); //posição 
  rotateY(frameCount * 0.02); // rotação no Y
  // criado para gerar o cilindro
  for(int i = 0; i < tubos;i++){
    float x = tuboX[i] * 50;
    float z = tuboY[i] * 50;
    float u = kanye.width / tubos*i;
    vertex(x, -100, z, u, 0);
    vertex(x, 100, z, u, kanye.height);
  }
  endShape();
  // parte de cima do cilindro
  beginShape(TRIANGLE_FAN); 
  texture(kanye); // textura
  for(int i = 0; i < tubos;i++){
    float x = tuboX[i] * 40;
    float z = tuboY[i] * 40;
    float u = kanye.width / tubos*i;
    vertex(x, -100, z, u, 0);
  }
  // vertices do cilindro
  vertex(tuboX[0]*100, -100, tuboY[0]*100, kanye.width, 0);
  endShape();
 popMatrix();
 //Nome
String cilindro = "Cilindro";
textAlign(CENTER, CENTER); // alinhamento do texto
fill(255); // cor
textSize(25); // tamanho do texto
text(cilindro, -800, -50, -150); // posição do texto

// Cilindro simples
  pushMatrix();
  beginShape(QUAD_STRIP);
  fill(128,255,128); // cor
  stroke(10);
  translate(550, 100, -150); // posição
  rotateY(frameCount * 0.05); // rotação
  // criado para gerar o cilindro
  for(int i = 0; i < tubos;i++){
    float x = tuboX[i] * 80;
    float z = tuboY[i] * 80;
    vertex(x, -80, z, 0, 0);
    vertex(x, 80, z, 0,0);
  }
  endShape();
  // parte de cima do cilindro
  beginShape(TRIANGLE_FAN);
   for(int i = 0; i < tubos;i++){
    float x = tuboX[i] * 80;
    float z = tuboY[i] * 80;
    vertex(x, -80, z, 0, 0);
   }
  endShape();
 popMatrix();
 //Nome
String cilindroTx = "Cilindro simples";
textAlign(CENTER, CENTER); // alinhamento
fill(255); // cor
textSize(25); // tamanho do texto
text(cilindroTx, 550, -50, -150); // posição do texto

// retangulo simples
pushMatrix();
  stroke(10); // cor da linha
  fill(218,112,214); // cor do retangulo
  translate(800,100,-150); // Move a origem para o centro da tela
  rotateY(frameCount * 0.01); // Rotaciona em torno do eixo Y
  rotateX(frameCount * 0); // Rotaciona em torno do eixo X
  
  beginShape(QUADS);
  //frente
  vertex(-100, -50, 50);
  vertex(100, -50, 50);
  vertex(100, 50, 50);
  vertex(-100, 50, 50);
 //atras
  vertex(-100, -50, -50);
  vertex(100, -50, -50);
  vertex(100, 50, -50);
  vertex(-100, 50, -50);
 //parte de cima
  vertex(-100, -50, 50);
  vertex(100, -50, 50);
  vertex(100, -50, -50);
  vertex(-100, -50, -50);
 // parte inferior
  vertex(-100, 50, 50);
  vertex(100, 50, 50);
  vertex(100, 50, -50);
  vertex(-100, 50, -50);
 // lado esquerdo
  vertex(-100, -50, 50);
  vertex(-100, 50, 50);
  vertex(-100, 50, -50);
  vertex(-100, -50, -50);
 //lado direito 
  vertex(100, -50, 50);
  vertex(100, 50, 50);
  vertex(100, 50, -50);
  vertex(100, -50, -50);
  endShape();
  popMatrix();
  
  // Nome
 String retSimples = "Retângulo simples";
textAlign(CENTER, CENTER); // alinhamento
fill(255); // cor
textSize(25); // tamanho do texto
text(retSimples, 800, -50, -150); // posição do texto 

//piramide texturizada
pushMatrix();
translate(1100, 100, -150); //posição da piramide
rotateX(frameCount * 0.02); // rotação no X
  beginShape();
  texture(jungkook); // textura
  //base da piramide
  vertex(-150 / 2, -150 / 2, -150 / 2, 0, 0);
  vertex(150 / 2, -150 / 2, -150 / 2, jungkook.width, 0);
  vertex(150 / 2, 150 / 2, -150 / 2, jungkook.width, jungkook.height);
  vertex(-150 / 2, 150 / 2, -150 / 2, 0, jungkook.height);
  endShape(CLOSE);
 //lados
 //primeiro lado
  beginShape();
  texture(jungkook);
  vertex(0, 0, 150, jungkook.width / 2, 0);
  vertex(-150 / 2, -150 / 2, -150 / 2, 0, jungkook.height);
  vertex(150 / 2, -150 / 2, -150 / 2, jungkook.width, jungkook.height);
  endShape(CLOSE);
 //segundo lado
  beginShape();
  texture(jungkook);
  vertex(0, 0, 150, jungkook.width / 2, 0);
  vertex(150 / 2, -150 / 2, -150 / 2, 0, jungkook.height);
  vertex(150 / 2, 150 / 2, -150 / 2, jungkook.width, jungkook.height);
  endShape(CLOSE);
 //terceiro lado
  beginShape();
  texture(jungkook);
  vertex(0, 0, 150, jungkook.width / 2, 0);
  vertex(150 / 2, 150 / 2, -150 / 2, jungkook.width, jungkook.height);
  vertex(-150 / 2, 150 / 2, -150 / 2, 0, jungkook.height);
  endShape(CLOSE);
 //quarto lado
  beginShape();
  texture(jungkook);
  vertex(0, 0, 150, jungkook.width / 2, 0);
  vertex(-150 / 2, 150 / 2, -150 / 2, jungkook.width, jungkook.height);
  vertex(-150 / 2, -150 / 2, -150 / 2, 0, jungkook.height);
  endShape(CLOSE);
  popMatrix();
  //Nome
 String piramideTx= "Pirâmide texturizada";
textAlign(CENTER, CENTER); // alinhamento do texto
fill(255); // cor
textSize(25); // tamanho
text(piramideTx, 1100, -50, -150); // posição
}
// feito para poder dar zoom rolando o mouse
void mouseWheel(MouseEvent event) {
  float e = event.getCount(); // valor da rolagem do mouse
  float zoom2 = zoom - e * mouse; // faz o calculo do novo valor do zoom
  if (zoom2 > 0.01 && zoom2 < 100) {   // verifica se o valor novo tá dentro do limite
    zoom = zoom2; // atualiza o valor
  }
}
//feito para rodar na galeria
void mouseDragged() {
  rodarY += (mouseX - pmouseX) * 0.02; // atualiza a rotação com base na diferença horizontal no mouse
  rodarX += (mouseY - pmouseY) * 0.02; // atualiza com base na diferença vertical do mouse
}
// foi feito um metodo de movimentação pelo teclado usando A,W,S,D,Q,E
void keyReleased(){
  float step = 20;
  if (key == 'w') { // W vai para frente
    z+= step;
  } else if (key == 's') { // S afasta o objeto
    z -= step;
  } else if (key == 'a') { // A vai para o lado esquerdo
    x += step;
  } else if (key == 'd') { // D vai para o lado direito
    x -= step;
  } else if (key == 'q') { // Q abaixa
    y -= step;
  } else if (key == 'e') { // E sobe
    y += step;
}
}
