with Ac8e.Instruction;

package Ac8e.Instruction_Creator is
   function Create (Op : Machine_Code)
      return Ac8e.Instruction.Instruction_Type'Class;
end Ac8e.Instruction_Creator;
