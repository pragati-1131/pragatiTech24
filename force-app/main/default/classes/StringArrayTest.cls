public class StringArrayTest {
    public static list<string> generateStringArray(integer n)
    {
          List<String> listNames= new list<String>();
        for(Integer i =0;i<n;i++){
            listNames.add('Test '+i);
        }
        return listNames;
    }
 }