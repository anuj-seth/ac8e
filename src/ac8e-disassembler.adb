with Ada.Text_IO;

with Ac8e.Hex_Utils;
with Ac8e.Instruction;
with Ac8e.Instruction.Printer;

package body Ac8e.Disassembler is

   package TIO renames Ada.Text_IO;

   procedure Disassemble (From_Address : RAM.Memory_Location;
                          Instructions : Natural) is
      Two_Bytes : Ac8e.Machine_Code;
      Instruction_Number : Natural := 0;
      Read_Address : RAM.Memory_Location := From_Address;
   begin
      Ada.Text_IO.Put_Line ("Instructions: " & Instructions'Image);
      while Instruction_Number < Instructions loop
         RAM.Read (Read_Address, 2, Two_Bytes);
         Ada.Text_IO.Put (Ac8e.Hex_Utils.Hex (Loc => Read_Address));
         Ada.Text_IO.Put (" ");
         Ada.Text_IO.Put (Ac8e.Hex_Utils.Hex (M => Two_Bytes));
         Ada.Text_IO.Put (" ");
         declare
            I : constant Instruction.Instruction_Type
               := Instruction.Create (Op => Two_Bytes);
         begin
            Ada.Text_IO.Put (Instruction.Printer.Put (I => I));
         end;
         Ada.Text_IO.New_Line;
         Instruction_Number := Instruction_Number + 1;
         Read_Address := Read_Address + 2;
      end loop;
   end Disassemble;
end Ac8e.Disassembler;
