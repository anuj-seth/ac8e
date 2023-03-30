with Ac8e.Random_Access_Memory;

package Ac8e.Instruction.Jump is
   type Jump_Type is new Instruction_Type with private;

   overriding
   procedure Create (Op : Machine_Code; J : out Jump_Type);

   overriding
   function Put (J : Jump_Type) return String;

private
   type Jump_Type is new Instruction_Type with
      record
         Jump_To : Ac8e.Random_Access_Memory.Memory_Location;
      end record;
end Ac8e.Instruction.Jump;
