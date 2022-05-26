function my_getbyid(id)
{
   itm = null;
   if (document.getElementById)
   {
      itm = document.getElementById(id);
   }
   else if (document.all)
   {
      itm = document.all[id];
   }
   else if (document.layers)
   {
      itm = document.layers[id];
   }
   
   return itm;
}