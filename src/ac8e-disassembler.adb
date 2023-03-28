with System;
with Ada.Text_IO;
with Ada.Integer_Text_IO;

with Ac8e.Hex_Utils;
with Ac8e.Instruction_Creator;
with Ac8e.Instruction;

package body Ac8e.Disassembler is

   package TIO renames Ada.Text_IO;

   type Instruction is
      record
         Nibble_1 : Byte;
         Nibble_2 : Byte;
         Nibble_3 : Byte;
         Nibble_4 : Byte;
      end record;

   procedure To_Instruction (Two_Bytes : Byte_Array; Op : out Instruction) is
   begin
      Op.Nibble_1 := Two_Bytes (Two_Bytes'First) / 16;
      Op.Nibble_2 := Two_Bytes (Two_Bytes'First) mod 16;
      Op.Nibble_3 := Two_Bytes (Two_Bytes'First + 1) / 16;
      Op.Nibble_4 := Two_Bytes (Two_Bytes'First + 1) mod 16;
   end To_Instruction;

   procedure Opcode_0 (Op : Instruction) is
   begin
      case Op.Nibble_2 is
         when 0 =>
            case Op.Nibble_3 is
               when 16#E# =>
                  case Op.Nibble_4 is
                     when 16#E# => TIO.Put ("RET");
                     when 0 => TIO.Put ("CLS");
                     when others => TIO.Put ("SYS");
                  end case;
               when others => TIO.Put ("SYS");
            end case;
         when others => TIO.Put ("SYS");
      end case;
   end Opcode_0;

   procedure Print_Opcode (Op : Instruction) is
   begin
      case Op.Nibble_1 is
         when 0 => Opcode_0 (Op);
         when others => TIO.Put ("Not Yet");
      end case;
   end Print_Opcode;

   procedure Disassemble (From_Address : RAM.Memory_Location;
                          Instructions : Natural) is
      Two_Bytes : Ac8e.Machine_Code;
      Instruction_Number : Natural := 0;
      Read_Address : RAM.Memory_Location := From_Address;
      Op : Instruction;
   begin
      Ada.Text_IO.Put_Line ("Instructions: " & Instructions'Image);
      while Instruction_Number < Instructions loop
         RAM.Read (Read_Address, 2, Two_Bytes);
         To_Instruction (Two_Bytes, Op);
         Ada.Integer_Text_IO.Put (Item => Read_Address, Base => 16);
         Ada.Text_IO.Put (" ");
         Ada.Text_IO.Put (Ac8e.Hex_Utils.Hex (Two_Bytes (1))
                          & Ac8e.Hex_Utils.Hex (Two_Bytes (2)));
         Print_Opcode (Op);
         Ada.Text_IO.New_Line;
         Instruction_Number := Instruction_Number + 1;
         Read_Address := Read_Address + 2;
         declare
            Clss : constant Ac8e.Instruction.Instruction_Type'Class
               := Ac8e.Instruction_Creator.Create (Two_Bytes);
         begin
            Ada.Text_IO.Put_Line (Clss.Put);
            --  Clss.Execute;
         end;
      end loop;

   end Disassemble;
end Ac8e.Disassembler;
