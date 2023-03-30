package Ac8e.Registers is
   subtype Eight_Bit_Type is Natural range 0 .. 255;
   subtype Sixteen_Bit_Type is Natural range 0 .. 2**16 - 1; 
   subtype V_Register_Identifier is Natural range 0 .. 15;

   procedure Set_V (X : V_Register_Identifier; 
                    Value : Eight_Bit_Type);

   Vx : array (V_Register_Identifier) of Eight_Bit_Type;
   I : Sixteen_Bit_Type;
end Ac8e.Registers;
