package Ac8e.Instruction.Skip.Byte_Rhs.Not_Equal is
   type Skip_Byte_Rhs_Not_Equal_Type is new Skip_Byte_Rhs_Type with null record;

   overriding
   procedure Create (Op : Machine_Code; Sne : out Skip_Byte_Rhs_Not_Equal_Type);

   overriding
   procedure Execute (Sne : Skip_Byte_Rhs_Not_Equal_Type);

   overriding
   function Put (Sne : Skip_Byte_Rhs_Not_Equal_Type) return String;
end Ac8e.Instruction.Skip.Byte_Rhs.Not_Equal;
