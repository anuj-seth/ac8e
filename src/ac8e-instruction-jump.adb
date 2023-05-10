with Ada.Text_IO;
with Ac8e.Hex_Utils;
with Ac8e.Instruction_Decoder;

package body Ac8e.Instruction.Jump is
   package RAM renames Ac8e.Random_Access_Memory;
   package HU renames Ac8e.Hex_Utils;
   package ID renames Ac8e.Instruction_Decoder;

   overriding
   procedure Create (Op : Machine_Code; J : out Jump_Type) is
      Jump_To_Address : constant RAM.Memory_Location := ID.NNN (Op);
   begin
      Ac8e.Instruction.Create (Op => Op, I => Instruction_Type (J));
      J.Jump_To := Jump_To_Address;
   end Create;

   overriding
   function Put (J : Jump_Type) return String is
      ("JMP " & HU.Hex (J.Jump_To));
end Ac8e.Instruction.Jump;
