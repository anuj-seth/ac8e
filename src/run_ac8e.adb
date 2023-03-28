with Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

with Ac8e.Random_Access_Memory;
with Ac8e.Hex_Utils;
with Ac8e.Disassembler;

procedure Run_Ac8e is
   B : Ac8e.Byte_Array (1 .. 20);
   Rom_Size : Natural;
   Instruction_Size_In_Bytes : constant := 2;
begin
   if Argument_Count < 1 then
      Ada.Text_IO.Put_Line ("ROM file name required");
      return;
   end if;

   declare
      Rom_File_Name : constant String := Argument (1);
   begin
      Ada.Text_IO.Put_Line (Rom_File_Name);
      Ac8e.Random_Access_Memory.Load_Rom (Rom_File_Name, Rom_Size);
   end;

   Ac8e.Disassembler.Disassemble (16#200#, Rom_Size / Instruction_Size_In_Bytes);
   --  Ada.Text_IO.Put_Line ("Rom size: " & Rom_Size'Image);
   --  Ada.Text_IO.Put_Line ("B first: " & B'First'Image);
   --  Ada.Text_IO.Put_Line ("B size: " & B'Last'Image);
   --  Ac8e.Random_Access_Memory.Read (16#200#, 20, B);
   --  for Idx in B'Range loop
   --     Ada.Text_IO.Put_Line (Ac8e.Hex_Utils.Hex (B (Idx)));
   --  end loop;
   
end Run_Ac8e;
