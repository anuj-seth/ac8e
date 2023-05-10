with Ac8e.Random_Access_Memory;
with Ac8e.Registers;

package Ac8e.Instruction_Decoder is
   package RAM renames Ac8e.Random_Access_Memory;

   --  nnn or addr - A 12-bit value, the lowest 12 bits of the instruction
   function NNN (Op : Machine_Code) return RAM.Memory_Location;

   --  n or nibble - A 4-bit value, the lowest 4 bits of the instruction
   --  x - A 4-bit value, the lower 4 bits of the high byte of the instruction
   function X (Op : Machine_Code) return Ac8e.Registers.Zero_To_Fifteen;
   --  y - A 4-bit value, the upper 4 bits of the low byte of the instruction
   function Y (Op : Machine_Code) return Ac8e.Registers.Zero_To_Fifteen;
   --  kk or byte - An 8-bit value, the lowest 8 bits of the instruction
   function KK (Op : Machine_Code) return Byte;
end Ac8e.Instruction_Decoder;
