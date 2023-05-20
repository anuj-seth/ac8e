with Ada.Sequential_IO;

package body Ac8e.Random_Access_Memory is
   Memory : Byte_Array (Memory_Location);

   function Is_Within_Limits (Start_Address : Memory_Location;
                              Bytes_To_Read : Positive)
      return Boolean is
      ((Start_Address + Bytes_To_Read) < Memory'Last);

   procedure Load_Rom (Rom_File_Name : String; Bytes_Loaded : out Natural) is
      package Rom_IO is
         new Ada.Sequential_IO (Byte);
      F : Rom_IO.File_Type;
      Bytes_Read : Natural := 0;
      Input : Byte;
      Start_Address : constant Memory_Location := 16#200#;
      Address : Memory_Location := Start_Address;
   begin
      Rom_IO.Open (F, Rom_IO.In_File, Rom_File_Name);
      while not Rom_IO.End_Of_File (F) loop
         Rom_IO.Read (F, Input);
         Write (Address, Input);
         Address := Address + 1;
      end loop;
      Rom_IO.Close (F);
      Bytes_Loaded := Address - Start_Address;
   end Load_Rom;

   function Read (Address : Memory_Location) return Byte is
      (Memory (Address));

   procedure Read (Address : Memory_Location;
                   Bytes_To_Read : Positive;
                   Buffer : out Byte_Array) is
      Last_Address : Memory_Location;
   begin
      if not Is_Within_Limits (Address, Bytes_To_Read) then
         raise Address_Overflow_Error;
      end if;

      Last_Address := Address + Bytes_To_Read - 1;
      Buffer (Buffer'First .. Bytes_To_Read)
         := Memory (Address .. Last_Address);
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
