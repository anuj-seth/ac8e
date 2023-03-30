with Ac8e.Random_Access_Memory;

package Ac8e.Instruction.Call_Subroutine is
   package RAM renames Ac8e.Random_Access_Memory;
   type Call_Subroutine_Type is new Instruction_Type with private;

   overriding
   procedure Create (Op : Machine_Code; C : out Call_Subroutine_Type);
   
   overriding
   function Put (C : Call_Subroutine_Type) return String;

private
   type Call_Subroutine_Type is new Instruction_Type with
      record
         Subroutine_Address : RAM.Memory_Location;
      end record;
end Ac8e.Instruction.Call_Subroutine;



