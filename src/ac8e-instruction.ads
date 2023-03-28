package Ac8e.Instruction is
   subtype Instruction_Categories is Natural range 0 .. 15;
   type Instruction_Type is tagged private;
   type Instruction_Access is access Instruction_Type'Class;

   Instruction_Not_Implemented : exception;

   procedure Create (Op : Machine_Code; I : out Instruction_Type);
   procedure Execute (I : Instruction_Type);
   function Put (I : Instruction_Type) return String;

private
   type Instruction_Type is tagged
      record
         Machine_Instruction : Machine_Code;
      end record;

end Ac8e.Instruction;
