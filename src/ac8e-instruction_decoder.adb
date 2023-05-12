package body Ac8e.Instruction_Decoder is
   function Op_Code (Op : Machine_Code) return Ac8e.Instruction.Op_Code is
      (Op (1) / 16);

   function NNN (Op : Machine_Code) return RAM.Memory_Location is
      Value : constant RAM.Memory_Location
         := ((Natural (Op (1)) mod 16) * 16 * 16)
            + Natural (Op (2));
   begin
      return Value;
   end NNN;

   function N (Op : Machine_Code) return Byte is
      (Op (2) mod 16);

   function KK (Op : Machine_Code) return Byte is
      (Op (2));

   function X (Op : Machine_Code) return Ac8e.Registers.Zero_To_Fifteen is
      (Natural (Op (1)) mod 16);

   function Y (Op : Machine_Code) return Ac8e.Registers.Zero_To_Fifteen is
      (Natural (Op (2)) / 16);
end Ac8e.Instruction_Decoder;
