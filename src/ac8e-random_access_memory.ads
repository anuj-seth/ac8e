package Ac8e.Random_Access_Memory is
   subtype Memory_Location is Natural range 0 .. 4095;

   procedure Load_Rom (Rom_File_Name : String; Bytes_Loaded : out Natural);
   function Read (Address : Memory_Location) return Byte;
   procedure Read (Address : Memory_Location;
                   Bytes_To_Read : Positive;
                   Buffer : out Byte_Array);

   procedure Write (Address : Memory_Location; Value : Byte);
   procedure Write (Address : Memory_Location; Values : Byte_Array);

   Address_Overflow_Error : exception;
end Ac8e.Random_Access_Memory;
