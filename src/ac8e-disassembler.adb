with System;
with Ada.Text_IO;
with Ada.Sequential_IO;

with Ac8e.Hex_Utils;

package body Ac8e.Disassembler is

   package TIO renames Ada.Text_IO;

   type Instruction is
      record
         Nibble_1 : Nibble;
         Nibble_2 : Nibble;
         Nibble_3 : Nibble;
         Nibble_4 : Nibble;
      end record with Size => 16;
   for Instruction use
      record
         Nibble_1 at 0 range 4 .. 7;
         Nibble_2 at 0 range 0 .. 3;
         Nibble_3 at 0 range 12 .. 15;
         Nibble_4 at 0 range 8 .. 11;
      end record;

   procedure Opcode_0 (Op : Instruction) is
   begin
      case Op.Nibble_2 is
         when 0 =>
            case Op.Nibble_3 is
               when 16#E# =>
                  case Op.Nibble_4 is
                     when 16#E# => TIO.Put_Line ("RET");
                     when 0 => TIO.Put_Line ("CLS");
                     when others => TIO.Put_Line ("SYS");
                  end case;
               when others => TIO.Put_Line ("SYS");
            end case;
         when others => TIO.Put_Line ("SYS");
      end case;
   end Opcode_0;

   procedure Print_Opcode (Op : Instruction) is
   begin
      case Op.Nibble_1 is
         when 0 => Opcode_0 (Op);
         when others => TIO.Put_Line ("Not Yet");
      end case;
   end Print_Opcode;

   package Instruction_IO is
      new Ada.Sequential_IO (Instruction);
   use Instruction_IO;

   procedure Disassemble (Binary_File_Name : String) is
      F : Instruction_IO.File_Type;
      Bytes_Read : Natural := 0;
      Value : Instruction;
   begin
      Ada.Text_IO.Put_Line (Instruction'Size'Image);
      Open (F, In_File, Binary_File_Name);
      while not End_Of_File (F) loop
         Read (F, Value);
         TIO.Put (Ac8e.Hex_Utils.Hex (Value.Nibble_1, Value.Nibble_2));
         TIO. Put (" ");
         TIO.Put (Ac8e.Hex_Utils.Hex (Value.Nibble_3, Value.Nibble_4));
         --  Nibble_IO.Put (Value.Nibble_2);
         --  Nibble_IO.Put (Value.Nibble_3);
         --  Nibble_IO.Put (Value.Nibble_4);
         Print_Opcode (Value);
         TIO.New_Line;
         Bytes_Read := Bytes_Read + 1;
      end loop;
      Close (F);
      TIO.Put_Line ("Bytes read " & Bytes_Read'Image);
   end Disassemble;
end Ac8e.Disassembler;
