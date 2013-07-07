// { NOT ANDROID  
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioOutput out;
Oscillator osc;
// } NOT ANDROID  

static final String MESSAGE = "HELLO WORLD ";

int charIndex = 0;
int lastTime;

ArrayList codes;
int codesCounter = 0;

int inputEndTime = 0;
static final int TIMEOUT = 2000;

String newStr = "";
String curStr = MESSAGE;

MorseCodec.Decoder dec = new MorseCodec.Decoder();
String decodedStr = "";

void setup() {
// { NOT ANDROID  
  size(640, 480);
// } NOT ANDROID  

//// { ANDROID  
//  size(displayWidth, displayHeight, P3D);
//  orientation(PORTRAIT);
//// } ANDROID  

  lastTime = millis();

  codes = MorseCodec.encode(MESSAGE);
// { NOT ANDROID  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 512);
  osc = new SineWave(440, 1.0f, out.sampleRate());
  out.addSignal(osc);  
  out.disableSignal(osc);  
// } NOT ANDROID  
}

void draw() {
  background(0);
  
  int now = millis();
  if (now >= inputEndTime) {
    if (!newStr.isEmpty()) {
      newStr = newStr.toUpperCase();
      codes = MorseCodec.encode(newStr);
      curStr = newStr;
      newStr = "";
      codesCounter = 0;
    }
  }
  
  text("Message:" + curStr, 10, 15);
  text("Type keys to change the message", 10, 30);

  if (codes != null && codes.size() > 0) {
    Integer p = (Integer)codes.get(codesCounter);

    if (p != null) {
      if (p != 0) {
        fill(255);
        ellipseMode(CENTER);
        ellipse(width/2, height/2, height/2, height/2);
// { NOT ANDROID  
        if (!out.isEnabled(osc))
          out.enableSignal(osc);
// } NOT ANDROID  
      } else {
// { NOT ANDROID  
        if (out.isEnabled(osc))
          out.disableSignal(osc);  
// } NOT ANDROID  
      }
    }
    
    String result = dec.process((p != null) && (p != 0));
    if (result != null)
      decodedStr = result;
    text("Decoded result:" + decodedStr, 10, 45);
    
    int dt = now - lastTime;
    if (dt > 100) {
      codesCounter = (codesCounter + 1) % codes.size();
      lastTime = now;
    }
  }
}

void keyTyped() {
  int t = millis();
  if (key != CODED) {
    newStr += String.valueOf(key);
    inputEndTime = t + TIMEOUT;
  }
}

// { NOT ANDROID  
void stop()
{
  out.close();
  minim.stop();
 
  super.stop();
}
// } NOT ANDROID  

