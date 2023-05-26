with Ac8e.Hex_Utils;

package body Ac8e.Instruction.Printer is
   package HU renames Ac8e.Hex_Utils;

   function Opcode_0 (I : Decoded_Instruction)
      return String is
   begin
      if I.X = 16#00# and then I.KK = 16#E0# then
         return "CLS";
      elsif I.X = 16#00# and then I.KK = 16#EE# then
         return "RET";
      else
         return "SYS " & HU.Hex (I.NNN);
      end if;
   end Opcode_0;

   function Opcode_1 (I : Decoded_Instruction)
      return String is
      ("JMP " & HU.Hex (I.NNN));

   function Opcode_2 (I : Decoded_Instruction)
      return String is
      ("CALL " & HU.Hex (Loc => I.NNN));

   function Opcode_3 (I : Decoded_Instruction)
      return String is
      ("SE V["
       & HU.Hex (One_Byte => Byte (I.X))
       & "], "
       & HU.Hex (One_Byte => I.KK));

   function Opcode_4 (I : Decoded_Instruction)
      return String is
      ("SNE V["
       & HU.Hex (One_Byte => Byte (I.X))
       & "], "
       & HU.Hex (One_Byte => I.KK));

   function Opcode_5 (I : Decoded_Instruction)
      return String is
      ("SE V[" & HU.Hex (One_Byte => Byte (I.X))
       & "], V["
       & HU.Hex (One_Byte => Byte (I.Y))
       & "]");

   function Opcode_6 (I : Decoded_Instruction)
      return String is
      ("LD V["
       & HU.Hex (One_Byte => Byte (I.X))
       & "], "
       & HU.Hex (One_Byte => I.KK));

   function Opcode_7 (I : Decoded_Instruction)
      return String is
      ("ADD V["
       & HU.Hex (One_Byte => Byte (I.X))
       & "], "
       & HU.Hex (One_Byte => I.KK));

   function Opcode_A (I : Decoded_Instruction)
      return String is
      ("LD I, "
       & HU.Hex (Loc => I.NNN));
   
   function Printer_Not_Implemented (I : Decoded_Instruction)
      return String is
      (HU.Hex (M => I.Machine_Instruction) & " : Not Implemented yet.");

   type Instruction_Printer is access function (I : Decoded_Instruction)
      return String;

   Dispatch_Print : constant array (Op_Code) of Instruction_Printer
      := (0 => Opcode_0'Access,
          1 => Opcode_1'Access,
          2 => Opcode_2'Access,
          3 => Opcode_3'Access,
          4 => Opcode_4'Access,
          5 => Opcode_5'Access,
          6 => Opcode_6'Access,
          7 => Opcode_7'Access,
          16#A# => Opcode_A'Access,
          others => Printer_Not_Implemented'Access);

   function Put (I : Decoded_Instruction) return String is
      (Dispatch_Print (I.Operation) (I => I));
end Ac8e.Instruction.Printer;
