package body Ac8e.Hex_Utils is
   Hex_Chars: constant array (Byte range 0 .. 15) 
      of Character := ('0', '1', '2', '3', '4', '5', '6', '7', '8',
                       '9', 'a', 'b', 'c', 'd', 'e', 'f');

   function Hex (One_Byte : Byte) return String is
      Lower_Nibble : constant Byte := One_Byte mod 16;
      Upper_Nibble : constant Byte := One_Byte / 16;
   begin
      return Hex_Chars (Upper_Nibble) & Hex_Chars (Lower_Nibble);
   end Hex;

   function Hex (M : Machine_Code) return String is
      (Hex (M (1)) & Hex (M (2)));

end Ac8e.Hex_Utils;
