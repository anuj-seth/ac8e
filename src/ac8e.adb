with Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

with Disassembler;

procedure Ac8e is
begin
   if Argument_Count < 1 then
      Ada.Text_IO.Put_Line ("ROM file name required");
      return;
   end if;

   declare
      ROM_File_Name : constant String := Argument (1);
   begin
      Ada.Text_IO.Put_Line (ROM_File_Name);
      Disassembler.Disassemble (ROM_File_Name);
   end;
end Ac8e;
