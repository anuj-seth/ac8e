package body Ac8e.Instruction.Clear_Screen is
   overriding
   procedure Create (Op : Machine_Code; C : out Clear_Screen_Type) is
   begin
      Ac8e.Instruction.Create (Op => Op, I => Instruction_Type (C));
   end Create;

   overriding
   function Put (I : Clear_Screen_Type) return String is
      ("CLS");
end Ac8e.Instruction.Clear_Screen;
