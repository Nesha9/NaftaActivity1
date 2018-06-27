//import 'dart:async';
import 'dart:html';

import 'dart:math';


void main()  {

    querySelector("#button").onClick.listen(getSum);

}

void getSum(MouseEvent event){

  InputElement Curlist1 = querySelector("#CurFrom");
  String cur1 = (Curlist1.value);


  InputElement Curlist2 = querySelector("#CurTo");
  String cur2 = (Curlist2.value);

  double cf = 0.0;

  switch(cur1) {
  //Currency 1 is USD
    case 'USD':
      if (cur2 == 'USD') {
        cf = 1.0;
      }
      else if (cur2 == 'CAD') {
        cf = 1.33118;
      }
      else if (cur2 == 'MXN') {
        cf = 19.9505;
      }
      break;

  //Currency 1 is CAD

    case 'CAD' :
      if (cur2 == 'USD') {
        cf = 0.751265;
      }
      else if (cur2 == 'CAD') {
        cf = 1.0;
      }
      else if (cur2 == 'MXN') {
        cf = 14.9882;
      }
      break;

  //Currency 1 is MXN

    case 'MXN':
      if (cur2 == 'USD') {
        cf = 0.0501366;
      }
      else if (cur2 == 'CAD') {
        cf = 0.0667164;
      }

      else if (cur2 == 'MXN') {
        cf = 1.0;
      }
      break;
  }
  double num1 = double.parse((querySelector("#num1") as InputElement).value);
//  double num2 = double.parse((querySelector("#num2") as InputElement).value);


  print(cur2);
  print(cur1);


  var sum =(num1 * cf).toString();

  querySelector("#sum").text = " = $sum";}
