package body Ac8e.Hex_Utils is

   Hex_Chars: constant array (Nibble) 
      of Character := ('0', '1', '2', '3', '4', '5', '6', '7', '8',
                       '9', 'a', 'b', 'c', 'd', 'e', 'f');

   function Hex (Half_Byte_1 : Nibble; Half_Byte_2 : Nibble) return String is
   begin
      return Hex_Chars(Half_Byte_1) & Hex_Chars(Half_Byte_2);
   end Hex;

   function Hex (One_Byte : Byte) return String is
      Lower_Nibble : constant Nibble := Nibble(One_Byte) mod 16;
      Upper_Nibble : constant Nibble := Nibble (One_Byte) / 16;
   begin
      return Hex (Upper_Nibble, Lower_Nibble);
   end Hex;

end Ac8e.Hex_Utils;
