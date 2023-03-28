package body Ac8e.Instruction.Return_From_Subroutine is
   procedure Create (Op : Machine_Code; R : out Return_From_Subroutine_Type) is
   begin
      Ac8e.Instruction.Create (Op => Op, I => Instruction_Type(R));
   end Create;

   overriding
   function Put (I : Return_From_Subroutine_Type) return String is
      ("RTS");
end Ac8e.Instruction.Return_From_Subroutine;
