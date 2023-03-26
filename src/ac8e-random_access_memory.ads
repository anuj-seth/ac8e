package Ac8e.Random_Access_Memory is
   subtype Memory_Location is Natural range 0 .. 4095;

   function Read (Address : Memory_Location) return Byte;
   function Read (Address : Memory_Location; Bytes_To_Read : Positive)
      return Byte_Array;

   procedure Write (Address : Memory_Location; Value : Byte);
   procedure Write (Address : Memory_Location; Values : Byte_Array);

   Address_Overflow_Error : exception;
end Ac8e.Random_Access_Memory;
