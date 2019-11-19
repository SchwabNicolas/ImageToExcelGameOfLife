final color WHITE = color(255, 255, 255);
final color BLACK = color(0, 0, 0);
final int[] order = {1, 0};
final int SENSIVITY = 130; // Max 255

PImage image;
PImage convertedImage;
String[] imageToString = new String[100];

void setup() {
  size(100, 100);
  image = loadImage("image.png");
  convertedImage = image;
  
  if(image.width > image.height) {
    convertedImage.resize(100,0);
  } else if(image.width < image.height) {
    convertedImage.resize(0,100);
  } else if(image.width == image.height) {
  }
  
  for (int y = 0; y < image.height; y++) {
    imageToString[y] = "";
    for (int x = 0; x < image.width; x++) {
      if (red(image.get(x, y)) < SENSIVITY || green(image.get(x, y)) < SENSIVITY || blue(image.get(x, y)) < SENSIVITY) {
        imageToString[y] += order[0] + "\t";
        convertedImage.set(x, y, BLACK);
      } else {
        imageToString[y] += order[1] + "\t";
        convertedImage.set(x, y, WHITE);
      }
    }
    
    if (imageToString[y].length() < 300) { //<>//
      for (int i = imageToString[y].length(); i < 300; i++) {
        imageToString[y] += "0\t";
      }
    }
  }
  for (int i = 0; i < imageToString.length; i++) {
    if (imageToString[i] == null || imageToString[i] == "") {
      imageToString[i] = "0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0";
    }
  }
  image(convertedImage, 0, 0);
  saveStrings("result.txt", imageToString);
  println("Converted image to text");
}
