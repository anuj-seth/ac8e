package body Ac8e.Instruction_Decoder is
   function NNN (Op : Machine_Code) return RAM.Memory_Location is
      Value : constant RAM.Memory_Location
         := ((Natural (Op (1)) mod 16) * 16 * 16)
            + Natural (Op (2));
   begin
      return Value;
   end NNN;

   function KK (Op : Machine_Code) return Byte is
      (Op (2));

   function X (Op : Machine_Code) return Ac8e.Registers.Zero_To_Fifteen is
      (Natural (Op (1)) mod 16);

   function Y (Op : Machine_Code) return Ac8e.Registers.Zero_To_Fifteen is
      (Natural (Op (2)) / 16);
end Ac8e.Instruction_Decoder;
