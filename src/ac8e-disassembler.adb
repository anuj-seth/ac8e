with System;
with Ada.Text_IO;
with Ada.Integer_Text_IO;

with Ac8e.Hex_Utils;
with Ac8e.Instruction_Creator;
with Ac8e.Instruction;

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
         --  To_Instruction (Two_Bytes, Op);
         Ada.Text_IO.Put (Ac8e.Hex_Utils.Hex (Loc => Read_Address));
         Ada.Text_IO.Put (" ");
         declare
            Clss : constant Ac8e.Instruction.Instruction_Type'Class
               := Ac8e.Instruction_Creator.Create (Two_Bytes);
         begin
            Ada.Text_IO.Put (Clss.Put);
         end;
         Ada.Text_IO.New_Line;
         Instruction_Number := Instruction_Number + 1;
         Read_Address := Read_Address + 2;
      end loop;

   end Disassemble;
end Ac8e.Disassembler;
