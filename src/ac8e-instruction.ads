with Ac8e.Random_Access_Memory;
with Ac8e.Registers;

package Ac8e.Instruction is
   package RAM renames Ac8e.Random_Access_Memory;

   subtype Op_Code is Byte range 0 .. 15;
      --  with Static_Predicate => Op_Code in 0 .. 15;
   --  TODO no longer needs to be tagged
   type Instruction_Type is private;

   Instruction_Not_Implemented : exception;

   function Create (Op : Machine_Code) return Instruction_Type;

private
   type Instruction_Type is
      record
         Machine_Instruction : Machine_Code;
         Operation : Op_Code;
         NNN : RAM.Memory_Location;
         X : Ac8e.Registers.Zero_To_Fifteen;
         Y : Ac8e.Registers.Zero_To_Fifteen;
         KK : Byte;
         N : Byte;
      end record;
end Ac8e.Instruction;
