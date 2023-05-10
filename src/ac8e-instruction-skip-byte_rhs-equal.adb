with Ac8e.Hex_Utils;
with Ac8e.Instruction_Decoder;

package body Ac8e.Instruction.Skip.Byte_Rhs.Equal is
   package HU renames Ac8e.Hex_Utils;
   package ID renames Ac8e.Instruction_Decoder;

   overriding
   procedure Create (Op : Machine_Code; Se : out Skip_Byte_Rhs_Equal_Type) is
   begin
      Ac8e.Instruction.Create (Op => Op, I => Instruction_Type (Se));
      Se.Vx := ID.X (Op);
      Se.KK := ID.KK (Op);
   end Create;

   overriding
   procedure Execute (Se : Skip_Byte_Rhs_Equal_Type) is
   begin
      null;
   end Execute;

   overriding
   function Put (Se : Skip_Byte_Rhs_Equal_Type) return String is
   begin
      return ("SE V[" & HU.Hex (Se.Vx) (4) & "], " & HU.Hex (Se.KK));
   end Put;
end Ac8e.Instruction.Skip.Byte_Rhs.Equal;
