with Ada.Text_IO;

with Ac8e.Hex_Utils;

package body Ac8e.Instruction.Not_Implemented is
   function Create (Op : Machine_Code) return Not_Implemented_Type is
      NI : Not_Implemented_Type;
   begin
      NI.Machine_Instruction := Op;
      return NI;
   end Create;

   procedure Execute (I : Not_Implemented_Type) is
   begin
      Ada.Text_IO.Put_Line (Ac8e.Hex_Utils.Hex (I.Machine_Instruction)
                            & " : Not Implemented yet");
   end Execute;

   function Put (I : Not_Implemented_Type) return String is
      (Ac8e.Hex_Utils.Hex (I.Machine_Instruction));
end Ac8e.Instruction.Not_Implemented;

