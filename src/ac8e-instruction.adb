with Ac8e.Instruction_Decoder;

package body Ac8e.Instruction is
   package ID renames Ac8e.Instruction_Decoder;

   function Create (Op : Machine_Code) return Instruction_Type is
      (Machine_Instruction => Op,
       Operation => ID.Op_Code (Op),
       X => ID.X (Op),
       Y => ID.Y (Op),
       NNN => ID.NNN (Op),
       KK => ID.KK (Op),
       N => ID.N (Op));
end Ac8e.Instruction;
