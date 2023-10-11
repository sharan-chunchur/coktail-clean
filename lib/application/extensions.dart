

extension NonNullString on String?{
  String orEmpty(){
    if(this == null){
      return "";
    }else {
      return this!;
    }
  }
}

extension NonNullInt on int?{
  int orZero(){
    if(this == null){
      return 0;
    }else {
      return this!;
    }
  }
}


class Solution {
  List<int> intersection(List<int> nums1, List<int> nums2) {
    Set<int> newNums1 = nums1.toSet();
    Set<int> newNum2 = nums2.toSet();
    return newNums1.intersection(newNum2).toList();
  }
}


