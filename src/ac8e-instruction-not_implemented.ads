package Ac8e.Instruction.Not_Implemented is
   type Not_Implemented_Type is new Instruction_Type with private;

   function Create (Op : Machine_Code) return Not_Implemented_Type;
   procedure Execute (I : Not_Implemented_Type);
   function Put (I : Not_Implemented_Type) return String;

private
   type Not_Implemented_Type is new Instruction_Type with
      record
         Nibble_1 : Byte;
         Nibble_2 : Byte;
         Nibble_3 : Byte;
         Nibble_4 : Byte;
         Machine_Instruction : Machine_Code;
      end record;
end Ac8e.Instruction.Not_Implemented;



