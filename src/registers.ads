package Registers is
   type Eight_Bit is mod 256;
   type Sixteen_Bit is mod 2 ** 16;
 
   subtype V_Register_Identifier is Positive range 0 .. 15;
   procedure Set_V (X : V_Register_Identifier; 
                    Value : Eight_Bit);

   Vx : array (0 .. 15) of Eight_Bit;
   I : Sixteen_Bit;
end Registers;
