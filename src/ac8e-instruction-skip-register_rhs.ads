with Ac8e.Registers;

package Ac8e.Instruction.Skip.Register_Rhs is
   type Skip_Register_Rhs_Type is new Skip_Type with private;

private
   type Skip_Register_Rhs_Type is new Skip_Type with
      record
         Vy : Ac8e.Registers.Zero_To_Fifteen;
      end record;
end Ac8e.Instruction.Skip.Register_Rhs;
