import 'package:flutter/material.dart';

List Fake = List.generate(16, (index) => "a");

class Dynamic extends StatelessWidget {
  const Dynamic({super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    int num_boxes = Fake.length;//number of boxes
    int overflow = 0;//to know
    int ind = 0;//index of where we get an additon close or equal to the num of boxes
    var list_num = List.generate(num_boxes, (index) => 1 + index);//a list containing 1 to the num of boxed
    int sum = 0;
    for (var numbers in list_num) {
      sum += numbers;
      if (num_boxes - sum < 5)//once our sum and the num_boxes is this close
       {
        ind = list_num.indexOf(numbers);//get the index of where this condition occur
        if (sum > num_boxes)//so that if probably our sum is greater than number of actual boxes:this here is to deal with
        // negative value
        {
          sum -= numbers;//go back to the sum of previous value  before this current sum
          overflow = num_boxes - sum;//this are the number of boxes left to get our desired number of boxes
          ind -= 1;//let it affect our index because we've moved a step back
        } else {
          overflow = num_boxes - sum;
        }
        break;
      }
    }
    int save = ind;
    int xx = 1;
    while (xx != overflow + 1) {
      list_num[ind] += 1;//add 1 box to each index from the top i.e where we spot a close value
      ind -= 1;
      if (ind == -1) {
        ind = save;//to restart
      }
      xx += 1;
      
    }
    print(list_num.sublist(0, save + 1));
    List original = list_num.sublist(0, save + 1);//this is the desired addition in the order we want
    
    return Scaffold(
      body: SingleChildScrollView(
        
        child: Container(
          //
          color:Colors.blueAccent,
          height: s.height,
          width:s.width,
          margin: EdgeInsets.only(left: s.width * 0.05),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            separatorBuilder: (_, index) => SizedBox(height: s.height * .05),
            itemCount: original.length,
            itemBuilder: (_, index) {
              print(original[original.length-index-1]);
              return Padding(
                padding:
                    EdgeInsets.only(left: s.width * (index+1) /8),
                child: Center(
                  child: Row(
                    children: List.generate(
                      original[original.length-index-1],
                      (index) => Container(
                        margin: EdgeInsets.only(right: s.width * .06),
                        height: s.height * .04,
                        width: s.height * .04,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
