with Ada.Text_IO;

package body Ac8e.Random_Access_Memory is
   Memory : Byte_Array (Memory_Location);

   function Is_Within_Limits (Start_Address : Memory_Location;
                              Bytes_To_Read : Positive)
      return Boolean is
      ((Start_Address + Bytes_To_Read) < Memory'Last);

   function Read (Address : Memory_Location) return Byte is
      (Memory (Address));

   function Read (Address : Memory_Location; Bytes_To_Read : Positive)
      return Byte_Array is
   begin
      if not Is_Within_Limits (Address, Bytes_To_Read) then
         raise Address_Overflow_Error;
      end if;

      declare
         Last_Address : constant Memory_Location := Address + Bytes_To_Read;
         B : constant Byte_Array (1 .. Bytes_To_Read + 1) := Memory (Address .. Last_Address);
      begin
         Ada.Text_IO.Put_Line ("Last address: " & Last_Address'Image);
         return B;
      end;
   end Read;

   procedure Write (Address : Memory_Location; Value : Byte) is
   begin
      Memory (Address) := Value;
   end Write;

   procedure Write (Address : Memory_Location; Values : Byte_Array) is
   begin
      if not Is_Within_Limits (Address, Values'Length) then
         raise Address_Overflow_Error;
      end if;

      Memory (Address .. Address + Values'Length) := Values;
   end Write;

end Ac8e.Random_Access_Memory;
