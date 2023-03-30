package body Ac8e.Util is
   function Lower_Three_Nibbles_Value (Op : Machine_Code) return Natural is
      Value : constant Natural := ((Natural (Op (1)) mod 16) * 16 * 16)
                                   + Natural (Op (2));
   begin
      return Value;
   end Lower_Three_Nibbles_Value;
end Ac8e.Util;
