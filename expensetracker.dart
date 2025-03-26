import 'dart:io';
class Expense{
  double amount;
 List<DateTime>date;
  String category;
  Expense({required this.amount ,required this.date,required this.category});

}

class expenseTracker extends Expense {
expenseTracker( double amount,List<DateTime>date,String category):super(amount:amount,date:date,category:category);
static List<Expense>expenseList=[  ];
 static Map<String,double>expenseMaping={};
 static Map<int,double>expenseMonth={};
addExpense(double amount,List<DateTime>date,String category)
{
  
expenseList.add(Expense(amount:amount, date:date, category:category));
print("Expense Added Succesfully!");
}
displayExpense()
{
  for(var disEx in expenseList)
  {
    print("Amount: ${disEx.amount} date: ${disEx.date} category:${disEx.category}");
    // print(disex.date[0]);
    
  }
}
monthExpense(int m)
{
for(var x in expenseList)
{
  for(var d in x.date)
  {
    if(d.month == m)
    {
expenseMonth[m]= (expenseMonth[m]??0)+x.amount;
print("month: ${m} : ${expenseMonth[m]}");
    }
  }
}
}
expenseSummary(String category)
{
  for(var x in expenseList)
  {
if(x.category == category)
{
expenseMaping[category]=(expenseMaping[category]??0)+x.amount;
print(expenseMaping[category]);

}
else{
  print("no category found!");
}

  }
  



}



}





void main()
{
expenseTracker myTracker=new expenseTracker(0.0,[],'unknown');
while(true)
{

  print("Choose an option:");
 print("1. Add Expense") ;
print("2. View Expenses");
print("3. View Summary");
print("4. Monthly Report");
stdout.write("Enter your choosen option here: ");
 String?  choice=stdin.readLineSync();
switch(choice)
{
case '1':
 stdout.write("Enter Amount: ");
  double amount=double.parse(stdin.readLineSync()!);

    stdout.write("Enter date: (YYYY/MM/DD) ");
  String date=stdin.readLineSync()!;
  List<DateTime>dateList = [DateTime.parse(date)];

   stdout.write("Enter Category: ");
  String category=stdin.readLineSync()!.toLowerCase();

  
  myTracker.addExpense(amount, dateList,category );
  break;
  case '2':
  myTracker.displayExpense();
  break;

  case '3':
  stdout.write("Enter Category: ");
  String cat=stdin.readLineSync()!.toLowerCase();
  

myTracker.expenseSummary(cat);
break;
case '4':
stdout.write("Enter month you want to check:");
int month=int.parse(stdin.readLineSync()!);
myTracker.monthExpense(month);
break;

}

 
  



}
}