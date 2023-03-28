package Ac8e.Instruction.Return_From_Subroutine is
   type Return_From_Subroutine_Type is new Instruction_Type with private;

   procedure Create (Op : Machine_Code; R : out Return_From_Subroutine_Type);

   overriding
   function Put (I : Return_From_Subroutine_Type) return String;

private
   type Return_From_Subroutine_Type is new Instruction_Type with
      null record;
end Ac8e.Instruction.Return_From_Subroutine;
