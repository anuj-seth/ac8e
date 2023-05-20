with Ac8e.Hex_Utils;

package body Ac8e.Instruction.Executor is
   procedure Executor_Not_Implemented (I : Decoded_Instruction) is
   begin
      raise Instruction_Not_Implemented
         with Ac8e.Hex_Utils.Hex (I.Machine_Instruction);
   end Executor_Not_Implemented;

   type Instruction_Executor is access procedure (I : Decoded_Instruction);
   Dispatch_Execute : array (Op_Code) of Instruction_Executor
      := (others => Executor_Not_Implemented'Access);

   procedure Execute (I : Decoded_Instruction) is
   begin
      Dispatch_Execute (I.Operation) (I => I);
   end Execute;
end Ac8e.Instruction.Executor;
