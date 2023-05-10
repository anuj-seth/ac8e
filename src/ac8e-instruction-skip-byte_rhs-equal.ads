package Ac8e.Instruction.Skip.Byte_Rhs.Equal is
   type Skip_Byte_Rhs_Equal_Type is new Skip_Byte_Rhs_Type with null record;

   overriding
   procedure Create (Op : Machine_Code; Se : out Skip_Byte_Rhs_Equal_Type);

   overriding
   procedure Execute (Se : Skip_Byte_Rhs_Equal_Type);

   overriding
   function Put (Se : Skip_Byte_Rhs_Equal_Type) return String;
end Ac8e.Instruction.Skip.Byte_Rhs.Equal;
