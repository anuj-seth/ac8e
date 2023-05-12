with Ac8e.Hex_Utils;

package body Ac8e.Instruction.Printer is
   package HU renames Ac8e.Hex_Utils;

   function Opcode_0 (I : Instruction_Type)
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

   function Opcode_1 (I : Instruction_Type)
      return String is
      ("JMP " & HU.Hex (I.NNN));

   function Opcode_2 (I : Instruction_Type)
      return String is
      ("CALL " & HU.Hex (I.NNN));

   function Opcode_3 (I : Instruction_Type)
      return String is
      ("SE V[" 
       & HU.Hex (One_Byte => Byte (I.X)) 
       & "], " 
       & HU.Hex (One_Byte => I.KK));

   function Opcode_4 (I : Instruction_Type)
      return String is
      ("SNE V[" 
       & HU.Hex (One_Byte => Byte (I.X)) 
       & "], " 
       & HU.Hex (One_Byte => I.KK));

   function Opcode_5 (I : Instruction_Type)
      return String is
      ("SE V[" & HU.Hex (One_Byte => Byte (I.X)) 
       & "], V[" 
       & HU.Hex (One_Byte => Byte (I.Y))
       & "]");

   function Printer_Not_Implemented (I : Instruction_Type)
      return String is
      (HU.Hex (M => I.Machine_Instruction) & " : Not Implemented yet.");

   type Instruction_Printer_Type is access function (I : Instruction_Type)
      return String;

   Dispatch_Print : constant array (Op_Code) of Instruction_Printer_Type 
      := (0 => Opcode_0'access,
          1 => Opcode_1'access,
          2 => Opcode_2'access,
          3 => Opcode_3'access,
          4 => Opcode_4'access,
          5 => Opcode_5'access,
          others => Printer_Not_Implemented'access);

   function Put (I : Instruction_Type) return String is
      (Dispatch_Print (I.Operation) (I => I));
end Ac8e.Instruction.Printer;
