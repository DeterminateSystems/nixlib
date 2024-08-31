{
  outputs = { self }: {
    test.upperFirstChar = self.lib.str.capitalizeFirstCharacterAscii "abc123";
    test.notLetter = self.lib.str.capitalizeFirstCharacterAscii "123abc";
    test.empty = self.lib.str.capitalizeFirstCharacterAscii "";
    test.oneChar = self.lib.str.capitalizeFirstCharacterAscii "a";

    lib = {
      /* Capitalize the first chararacter of a string.

        Type: capitalizeFirstCharacterAscii :: str -> str

        Example:
            nixlib.str.capitalizeFirstCharacterAscii "mystr"
            => "Mystr"
        */
      capitalizeFirstCharacterAscii = # Input string to capitalize
        string:
        self.lib.str.capitalizeFirstCharacterAscii string;
      str = {
        /* Capitalize the first chararacter of a string.

        Type: capitalizeFirstCharacterAscii :: str -> str

        Example:
            nixlib.str.capitalizeFirstCharacterAscii "mystr"
            => "Mystr"
        */
        capitalizeFirstCharacterAscii =
          # Input string to capitalize
          string:
          let
            charmap = {
              a = "A";
              b = "B";
              c = "C";
              d = "D";
              e = "E";
              f = "F";
              g = "G";
              h = "H";
              i = "I";
              j = "J";
              k = "K";
              l = "L";
              m = "M";
              n = "N";
              o = "O";
              p = "P";
              q = "Q";
              r = "R";
              s = "S";
              t = "T";
              u = "U";
              v = "V";
              w = "W";
              x = "X";
              y = "Y";
              z = "Z";
            };
            prefix = builtins.substring 0 1 string;
          in
          "${charmap.${prefix} or prefix}${builtins.substring 1 (builtins.stringLength string) string}";
      };
    };
  };
}
