with System;
with Ada.Text_IO;
with Ada.Sequential_IO;

package body Disassembler is
   procedure Disassemble (Binary_File_Name : String) is
      type Nibble is mod 2**4;
      package Nibble_IO is
         new Ada.Text_IO.Modular_IO (Num => Nibble);

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

--      procedure Print_Opcode (Op : Instruction) is
--      begin
 --        case Op.Nibble_1 is
  --          when 0 =>
   --            case Op.Nibble_2 is
    --              when 0 => 
     --                case Op.Nibble_3 is
      --                  when 14 =>
       --                    case Op.Nibble_4 is
        --                      when 0 => Ada.Text_IO.Put_Line ("CLS");
         --                     when 14 => Ada.Text_IO.Put_Line ("RET");
          --                    others => Ada.Text_IO.Put_Line ("Invalid instruction");
           --                end case;
            --               others => Ada.Text_IO.Put_Line ("Invalid instruction");
--
  --             end case;
    --     end case;
      --end Print_Opcode;

      package Instruction_IO is
         new Ada.Sequential_IO (Instruction);
      use Instruction_IO;

      F : Instruction_IO.File_Type;
      Bytes_Read : Natural := 0;
      Value : Instruction;
   begin
      Ada.Text_IO.Put_Line (Instruction'Size'Image);
      Open (F, In_File, Binary_File_Name);
      while not End_Of_File (F) loop
         Read (F, Value);
         Nibble_IO.Put (Value.Nibble_1);
         Nibble_IO.Put (Value.Nibble_2);
         Nibble_IO.Put (Value.Nibble_3);
         Nibble_IO.Put (Value.Nibble_4);
         Ada.Text_IO.New_Line;
         Bytes_Read := Bytes_Read + 1;
      end loop;
      Close (F);
      Ada.Text_IO.Put_Line ("Bytes read " & Bytes_Read'Image);
   end Disassemble;
end Disassembler;
