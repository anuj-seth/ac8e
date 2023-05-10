with Ac8e.Hex_Utils;
with Ac8e.Instruction_Decoder;

package body Ac8e.Instruction.Skip.Register_Rhs.Equal is
   package HU renames Ac8e.Hex_Utils;
   package ID renames Ac8e.Instruction_Decoder;

   overriding
   procedure Create (Op : Machine_Code; Se : out Skip_Register_Rhs_Equal_Type) is
   begin
      Ac8e.Instruction.Create (Op => Op, I => Instruction_Type (Se));
      Se.Vx := ID.X (Op);
      Se.Vy := ID.Y (Op);
   end Create;

   overriding
   procedure Execute (Se : Skip_Register_Rhs_Equal_Type) is
   begin
      null;
   end Execute;

   overriding
   function Put (Se : Skip_Register_Rhs_Equal_Type) return String is
   begin
      return ("SE V[" & HU.Hex (Se.Vx) (4) & "], V[" & HU.Hex (Se.Vy) (4) & "]");
   end Put;
end Ac8e.Instruction.Skip.Register_Rhs.Equal;
