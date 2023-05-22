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
      Test_Op_Code_Arithmetic : Op_Code_As_Byte := 0;
      Test_Bool : Boolean;
   begin
      for I in Test_Op_Code_Arithmetic .. 5 loop
         Ada.Text_IO.Put (I'Image);
      end loop;
      Test_Bool := (Test_Op_Code_Arithmetic + 5) = 5;
      TIO.Put_Line ("Comparison "  & Test_Bool'Image);
      TIO.Put_Line ("Instructions: " & Instructions'Image);
      while Instruction_Number < Instructions loop
         RAM.Read (Read_Address, 2, Two_Bytes);
         TIO.Put (Ac8e.Hex_Utils.Hex (Loc => Read_Address));
         TIO.Put (" ");
         TIO.Put (Ac8e.Hex_Utils.Hex (M => Two_Bytes));
         TIO.Put (" ");
         if Instruction.Is_Instruction (Op => Two_Bytes) then
            declare
               I : constant Instruction.Decoded_Instruction
                  := Instruction.Create (Op => Two_Bytes);
            begin
               TIO.Put (Instruction.Printer.Put (I => I));
            end;
         else
            TIO.Put ("DATA");
         end if;
         TIO.New_Line;
         Instruction_Number := Instruction_Number + 1;
         Read_Address := Read_Address + 2;
      end loop;
   end Disassemble;
end Ac8e.Disassembler;
