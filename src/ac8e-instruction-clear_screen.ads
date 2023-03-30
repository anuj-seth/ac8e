package Ac8e.Instruction.Clear_Screen is
   type Clear_Screen_Type is new Instruction_Type with private;

   overriding
   procedure Create (Op : Machine_Code; C : out Clear_Screen_Type);

   overriding
   function Put (I : Clear_Screen_Type) return String;

private
   type Clear_Screen_Type is new Instruction_Type with
      null record;
end Ac8e.Instruction.Clear_Screen;
