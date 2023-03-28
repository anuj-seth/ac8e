with Ac8e.Hex_Utils;

package body Ac8e.Instruction is
   procedure Create (Op : Machine_Code; I : out Instruction_Type) is
   begin
      I.Machine_Instruction := Op;
   end Create;

   procedure Execute (I : Instruction_Type) is
   begin
      raise Instruction_Not_Implemented 
         with Ac8e.Hex_Utils.Hex (I.Machine_Instruction);
   end Execute;

   function Put (I : Instruction_Type) return String is
      (Ac8e.Hex_Utils.Hex (I.Machine_Instruction) & " : Not Implemented yet.");
end Ac8e.Instruction;
