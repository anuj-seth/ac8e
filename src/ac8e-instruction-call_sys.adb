with Ac8e.Hex_Utils;
with Ac8e.Instruction_Decoder;

package body Ac8e.Instruction.Call_Sys is
   package HU renames Ac8e.Hex_Utils;
   package ID renames Ac8e.Instruction_Decoder;

   overriding
   procedure Create (Op : Machine_Code; C : out Call_Sys_Type) is
      Jump_To_Address : constant RAM.Memory_Location := ID.NNN (Op);
   begin
      Ac8e.Instruction.Create (Op => Op, I => Instruction_Type (C));
      C.Subroutine_Address := Jump_To_Address;
   end Create;

   overriding
   procedure Execute (C : Call_Sys_Type) is
   begin
      null;
   end Execute;

   overriding
   function Put (C : Call_Sys_Type) return String is
      ("SYS " & HU.Hex (C.Subroutine_Address));
end Ac8e.Instruction.Call_Sys;
