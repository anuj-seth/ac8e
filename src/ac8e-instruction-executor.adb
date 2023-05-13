with Ac8e.Hex_Utils;

package body Ac8e.Instruction.Executor is
   procedure Executor_Not_Implemented (I : Instruction_Type) is
   begin
      raise Instruction_Not_Implemented
         with Ac8e.Hex_Utils.Hex (I.Machine_Instruction);
   end Executor_Not_Implemented;

   type Instruction_Executor_Type is access procedure (I : Instruction_Type);
   Dispatch_Execute : array (Op_Code) of Instruction_Executor_Type
      := (others => Executor_Not_Implemented'access);

   procedure Execute (I : Instruction_Type) is
   begin
      Dispatch_Execute (I.Operation) (I => I);
   end Execute;
end Ac8e.Instruction.Executor;
