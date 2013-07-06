import java.util.Arrays;
import java.util.Map;
import java.util.Iterator;

static class MorseCodec {
  static final int[] A = {
    1, 3
  };
  static final int[] B = {
    3, 1, 1, 1
  };
  static final int[] C = {
    3, 1, 3, 1
  };
  static final int[] D = {
    3, 1, 1
  };
  static final int[] E = {
    1
  };
  static final int[] F = {
    1, 1, 3, 1
  };
  static final int[] G = {
    3, 3, 1
  };
  static final int[] H = {
    1, 1, 1, 1
  };
  static final int[] I = {
    1, 1
  };
  static final int[] J = {
    1, 3, 3, 3
  };
  static final int[] K = {
    3, 1, 3
  };
  static final int[] L = {
    1, 3, 1, 1
  };
  static final int[] M = {
    3, 3
  };
  static final int[] N = {
    3, 1
  };
  static final int[] O = {
    3, 3, 3
  };
  static final int[] P = {
    1, 3, 3, 1
  };
  static final int[] Q = {
    3, 3, 1, 3
  };
  static final int[] R = {
    1, 3, 1
  };
  static final int[] S = {
    1, 1, 1
  };
  static final int[] T = {
    3
  };
  static final int[] U = {
    1, 1, 3
  };
  static final int[] V = {
    1, 1, 1, 3
  };
  static final int[] W = {
    1, 3, 3
  };
  static final int[] X = {
    3, 1, 1, 3
  };
  static final int[] Y = {
    3, 1, 3, 3
  };
  static final int[] Z = {
    3, 3, 1, 1
  };

  static final int[] _1 = {
    1, 3, 3, 3, 3
  };
  static final int[] _2 = {
    1, 1, 3, 3, 3
  };
  static final int[] _3 = {
    1, 1, 1, 3, 3
  };
  static final int[] _4 = {
    1, 1, 1, 1, 3
  };
  static final int[] _5 = {
    1, 1, 1, 1, 1
  };
  static final int[] _6 = {
    3, 1, 1, 1, 1
  };
  static final int[] _7 = {
    3, 3, 1, 1, 1
  };
  static final int[] _8 = {
    3, 3, 3, 1, 1
  };
  static final int[] _9 = {
    3, 3, 3, 3, 1
  };
  static final int[] _0 = {
    3, 3, 3, 3, 3
  };

  static final int[] PERIOD = {
    1, 3, 1, 3, 1, 3
  };
  static final int[] COMMA = {
    3, 3, 1, 1, 3, 3
  };
  static final int[] QUESTION = {
    1, 1, 3, 3, 1, 1
  };
  static final int[] EXCLAMATION = {
    3, 1, 3, 1, 3, 3
  };
  static final int[] HYPHEN = {
    3, 1, 1, 1, 1, 3
  };
  static final int[] SLASH = {
    3, 1, 1, 3, 1
  };
  static final int[] AT = {
    1, 3, 3, 1, 3, 1
  };
  static final int[] OPEN_BLACKET = {
    3, 1, 3, 3, 1
  };
  static final int[] CLOSE_BLACKET = {
    3, 1, 3, 3, 1, 3
  };

  static final int[] SPACE = {
    1, 1, 1, 1, 1, 1
  };
  
  static HashMap dictionary;

  static void initializeDictionary() {
    if (dictionary != null)
      return;
    dictionary = new HashMap();
    dictionary.put('A', A);
    dictionary.put('B', B);
    dictionary.put('C', C);
    dictionary.put('D', D);
    dictionary.put('E', E);
    dictionary.put('F', F);
    dictionary.put('G', G);
    dictionary.put('H', H);
    dictionary.put('I', I);
    dictionary.put('J', J);
    dictionary.put('K', K);
    dictionary.put('L', L);
    dictionary.put('M', M);
    dictionary.put('N', N);
    dictionary.put('O', O);
    dictionary.put('P', P);
    dictionary.put('Q', Q);
    dictionary.put('R', R);
    dictionary.put('S', S);
    dictionary.put('T', T);
    dictionary.put('U', U);
    dictionary.put('V', V);
    dictionary.put('W', W);
    dictionary.put('X', X);
    dictionary.put('Y', Y);
    dictionary.put('Z', Z);
    dictionary.put('1', _1);
    dictionary.put('2', _2);
    dictionary.put('3', _3);
    dictionary.put('4', _4);
    dictionary.put('5', _5);
    dictionary.put('6', _6);
    dictionary.put('7', _7);
    dictionary.put('8', _8);
    dictionary.put('9', _9);
    dictionary.put('0', _0);
    dictionary.put('.', PERIOD);
    dictionary.put(',', COMMA);
    dictionary.put('?', QUESTION);
    dictionary.put('!', EXCLAMATION);
    dictionary.put('-', HYPHEN);
    dictionary.put('/', SLASH);
    dictionary.put('@', AT);
    dictionary.put('(', OPEN_BLACKET);
    dictionary.put(')', CLOSE_BLACKET);
    dictionary.put(' ', SPACE);
  }
  
  static final char getCharacter(int[] a) {
    initializeDictionary();
    for (Iterator it = dictionary.entrySet().iterator(); it.hasNext();) {
      Map.Entry entry = (Map.Entry)it.next();    
      char c = (Character)entry.getKey();
      int[] s = (int[])entry.getValue();
      if (Arrays.equals(a, s)) {
        return c;
      }
    }
    return 0;
  }

  static final int[] getPattern(char c) {
    initializeDictionary();
    return (int[])dictionary.get(c);
  }

  static ArrayList encode(String s) {
    s = s.toUpperCase();

    ArrayList c = new ArrayList();
    for (int i = 0; i < s.length(); i++) {
      char ch = s.charAt(i);
      println(ch);
      int[] code = getPattern(ch);
      if (code == null)
        continue;
      for (int j = 0; j < code.length; j++) {
        int n = code[j];
        for (int k = 0; k < n; k++) {
          c.add(1);
        } 
        c.add(0);
      }
      c.add(0);
      c.add(0);
      c.add(0);
    }

    return c;
  }

  static Decoder createDecoder() {
    return new Decoder();
  }

  static class Decoder {
    long upstrokeTime;
    long downstrokeTime;
    boolean hlPrev;
    ArrayList queue;
    static final float TOLERANCE = 2.0f;

    public Decoder() {
      hlPrev = false;
      queue = new ArrayList();
    }

    // decoding is highly adaptive, context-dependent and dynamic process.
    public String process(boolean isHigh) {

      long now = System.currentTimeMillis();
      if (!hlPrev && isHigh) {
        // LOW to HIGH
        if (downstrokeTime != 0)
          queue.add(downstrokeTime - now); // blank dulation, negative value represents a marker.
        upstrokeTime = now;
      } else if (hlPrev && !isHigh) {
        // HIGH to LOW
        if (upstrokeTime != 0)
          queue.add(now - upstrokeTime);
        downstrokeTime = now;
      }
      hlPrev = isHigh;
      
      int lastIndex = -1;

      if (!isHigh && queue.size() >= 6) {
        long minimum = (Long)queue.get(0);
        long maximum = minimum;
        for (int i = 1; i < queue.size(); i++) {
          long d = (Long)queue.get(i);
          if (d > 0) {
            if (minimum > d)
              minimum = d;
            else if (maximum < d)
              maximum = d;
          }
        }

        
        if (queue.size() > 6) {

          long dotMax = (long)(minimum * TOLERANCE);
          long dashMax = dotMax * 3;

          for (int i = queue.size() - 1; i >= 0; i--) {
            long d = (Long)queue.get(i);  
            if (d < -dotMax) { // dash
              lastIndex = i;
              break;
            }
          }
          
          if (lastIndex >= 0) {
            println("lastIndex:" + lastIndex);
            
            // convert to string
            ArrayList tmp = new ArrayList();
            String res = "";
            for (int i = 0; i < lastIndex; i++) {
              long d = (Long)queue.get(i);
              if (d > 0 && d <= dotMax) {
                tmp.add(1);
              } else if (d > dotMax && d < dashMax) {
                tmp.add(3);
              }
            }            
            int[] array = new int[tmp.size()];
            for (int j = 0; j < tmp.size(); j++) {
              array[j] = (Integer)tmp.get(j);
            }
            char c = getCharacter(array);
            if (c != 0)
              res = String.valueOf(c);
            println(res);

            // remove processed result
            do {
              queue.remove(lastIndex);
              lastIndex--;
            } while (lastIndex >= 0);
            
            return res;
          }
        }        
      }
      return null;
    }
  }
}

