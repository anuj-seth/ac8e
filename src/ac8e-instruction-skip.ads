with Ac8e.Registers;

package Ac8e.Instruction.Skip is
   type Skip_Type is new Instruction_Type with private;

private
   type Skip_Type is new Instruction_Type with
      record
         Vx : Ac8e.Registers.Zero_To_Fifteen;
      end record;
end Ac8e.Instruction.Skip;
