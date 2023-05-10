with Ac8e.Hex_Utils;
with Ac8e.Instruction_Decoder;

package body Ac8e.Instruction.Skip.Byte_Rhs.Not_Equal is
   package HU renames Ac8e.Hex_Utils;
   package ID renames Ac8e.Instruction_Decoder;

   overriding
   procedure Create (Op : Machine_Code; Sne : out Skip_Byte_Rhs_Not_Equal_Type) is
   begin
      Ac8e.Instruction.Create (Op => Op, I => Instruction_Type (Sne));
      Sne.Vx := ID.X (Op);
      Sne.KK := ID.KK (Op);
   end Create;

   overriding
   procedure Execute (Sne : Skip_Byte_Rhs_Not_Equal_Type) is
   begin
      null;
   end Execute;

   overriding
   function Put (Sne : Skip_Byte_Rhs_Not_Equal_Type) return String is
   begin
      return ("SNE V[" & HU.Hex (Sne.Vx) (4) & "], " & HU.Hex (Sne.KK));
   end Put;
end Ac8e.Instruction.Skip.Byte_Rhs.Not_Equal;
