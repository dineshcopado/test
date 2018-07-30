public class RandomContactFactory
{

public static List<contact> conList = new List<contact>();

public static List<contact> generateRandomContacts(Integer integ, String lastName)
{

for(integer i=0; i<integ; i++)
conList.add(new contact(firstname='Test'+i,lastName='test'));

return conList;

}
}