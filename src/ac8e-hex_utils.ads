with Ac8e.Random_Access_Memory;

package Ac8e.Hex_Utils is
   function Hex (One_Byte : Byte) return String;
   function Hex (M : Machine_Code) return String;
   function Hex (Loc : Ac8e.Random_Access_Memory.Memory_Location)
      return String;
end Ac8e.Hex_Utils;
