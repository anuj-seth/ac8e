with Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

with Ac8e.Random_Access_Memory;
with Ac8e.Disassembler;

procedure Run_Ac8e is
   B : Ac8e.Byte_Array (1 .. 21);
begin
   if Argument_Count < 1 then
      Ada.Text_IO.Put_Line ("ROM file name required");
      return;
   end if;

   --  declare
   --   ROM_File_Name : constant String := Argument (1);
   --  begin
   --   Ada.Text_IO.Put_Line (ROM_File_Name);
   --   Ac8e.Disassembler.Disassemble (ROM_File_Name);
   --  end;
   B := Ac8e.Random_Access_Memory.Read (1200, 20);
end Run_Ac8e;
