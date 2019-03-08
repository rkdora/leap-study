import ddf.minim.*;
import de.voidplus.leapmotion.*;

// ======================================================
// Table of Contents:
// ├─ 1. Swipe Gesture
// ├─ 2. Circle Gesture
// ├─ 3. Screen Tap Gesture
// └─ 4. Key Tap Gesture
// ======================================================

Minim minim;
AudioPlayer player;

LeapMotion leap;

void setup(){
  size(800, 500);
  background(255);
  textSize(50);
  fill(0);
  
  minim = new Minim(this);
  player = minim.loadFile("punch-middle2.mp3");

  leap = new LeapMotion(this).allowGestures();  // All gestures
  // leap = new LeapMotion(this).allowGestures("circle, swipe, screen_tap, key_tap");
  // leap = new LeapMotion(this).allowGestures("swipe");  // Leap detects only swipe gestures
}

void draw(){
  //background(255);
  // ...
}


// ======================================================
// 1. Swipe Gesture

void leapOnSwipeGesture(SwipeGesture g, int state){
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector position         = g.getPosition();
  PVector positionStart    = g.getStartPosition();
  PVector direction        = g.getDirection();
  float   speed            = g.getSpeed();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();

  switch(state){
    case 1: // Start
      break;
    case 2: // Update
      break;
    case 3: // Stop
      println("SwipeGesture: " + id);
      background(255);
      background(255, 0, 0);
      player.play();
      player.rewind();
      text("SwipeGesture: " + id, width / 4, height / 2);
      break;
  }
}


// ======================================================
// 2. Circle Gesture

void leapOnCircleGesture(CircleGesture g, int state){
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector positionCenter   = g.getCenter();
  float   radius           = g.getRadius();
  float   progress         = g.getProgress();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();
  int     direction        = g.getDirection();

  switch(state){
    case 1: // Start
      break;
    case 2: // Update
      break;
    case 3: // Stop
      println("CircleGesture: " + id);
      background(255);
      text("CircleGesture: " + id, width / 4, height / 2);
      break;
  }

  switch(direction){
    case 0: // Anticlockwise/Left gesture
      break;
    case 1: // Clockwise/Right gesture
      break;
  }
}


// ======================================================
// 3. Screen Tap Gesture

void leapOnScreenTapGesture(ScreenTapGesture g){
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector position         = g.getPosition();
  PVector direction        = g.getDirection();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();

  println("ScreenTapGesture: " + id);
  background(255);
  text("ScreenTapGesture: " + id, width / 4, height / 2);
}


// ======================================================
// 4. Key Tap Gesture

void leapOnKeyTapGesture(KeyTapGesture g){
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector position         = g.getPosition();
  PVector direction        = g.getDirection();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();

  println("KeyTapGesture: " + id);
  background(255);
  text("KeyTapGesture: " + id, width / 4, height / 2);
}

void stop(){
  player.close();
  minim.stop();
  super.stop();
}
