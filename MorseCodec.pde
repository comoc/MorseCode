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

  static final int[] getPattern(char c) {
    switch (c) {
    case 'A': 
      return A;
    case 'B': 
      return B;
    case 'C': 
      return C;
    case 'D': 
      return D;
    case 'E': 
      return E;
    case 'F': 
      return F;
    case 'G': 
      return G;
    case 'H': 
      return H;
    case 'I': 
      return I;
    case 'J': 
      return J;
    case 'K': 
      return K;
    case 'L': 
      return L;
    case 'M': 
      return M;
    case 'N': 
      return N;
    case 'O': 
      return O;
    case 'P': 
      return P;
    case 'Q': 
      return Q;
    case 'R': 
      return R;
    case 'S': 
      return S;
    case 'T': 
      return T;
    case 'U': 
      return U;
    case 'V': 
      return V;
    case 'W': 
      return W;
    case 'X': 
      return X;
    case 'Y': 
      return Y;
    case 'Z': 
      return Z;

    case '1': 
      return _1;
    case '2': 
      return _2;
    case '3': 
      return _3;
    case '4': 
      return _4;
    case '5': 
      return _5;
    case '6': 
      return _6;
    case '7': 
      return _7;
    case '8': 
      return _8;
    case '9': 
      return _9;
    case '0': 
      return _0;
    case '.': 
      return PERIOD;
    case ':': 
      return COMMA;
    case '?': 
      return QUESTION;
    case '!': 
      return EXCLAMATION;
    case '-':
      return HYPHEN;
    case '/': 
      return SLASH;
    case '@': 
      return AT;
    case '(': 
      return OPEN_BLACKET;
    case ')': 
      return CLOSE_BLACKET;
    case ' ': 
      return SPACE;
    default:
      return null;
    }
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
  
  static class Decoder {
    int dotLen;
    boolean hlPrev;
    ArrayList beforePrediction;
    Decoder() {
      dotLen = 0;
      hlPrev = false;
    }
    
    // decoding is highly adaptive, context-dependent and dynamic process.
    void process(boolean hl) {
      // TODO To be implemented.
      if (!hlPrev && hl) {
        // HIGH
      } else if (hlPrev && !hl) {
        // LOW
      }
      hlPrev = hl;
    }
  }
}

