package Ac8e.Instruction.Skip.Byte_Rhs is
   type Skip_Byte_Rhs_Type is new Skip_Type with private;

private
   type Skip_Byte_Rhs_Type is new Skip_Type with
      record
         KK : Byte;
      end record;
end Ac8e.Instruction.Skip.Byte_Rhs;
