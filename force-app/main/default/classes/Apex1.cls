public class Apex1 {
    public static void printData(){
      
   
      Map<Integer,String> mapNames= new Map<Integer,String>();
      mapNames.put(0,'Sakshi');
      mapNames.put(1,'Pragati');
      mapNames.put(2,'Harsh');
      System.debug(mapNames.get(1));
      System.debug(mapNames.containsKey(1)); 
       
      
    }

}