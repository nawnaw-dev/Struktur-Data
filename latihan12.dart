import 'dart:io';
//shell sort ascending
void ShellSortAsc(List<int> arr) { 
  
  int n = arr.length;
  for (int gap = n ~/ 2; gap > 0; gap ~/= 2) {
  for (int i = gap; i < n; i += 1) {
    int temp = arr[i];
    int j;
    
  for(j=i; j>=gap && arr[j-gap] > temp; j -= gap) {
    arr[j] = arr[j - gap];
    }
    arr[j] = temp;
   }
 }
}

//shell sort descending
void ShellSortDsc(List<int> arr) { 
  
  int n = arr.length;
  for (int gap = n ~/ 2; gap > 0; gap ~/= 2) {
  for (int i = gap; i < n; i += 1) {
    int temp = arr[i];
    int j;
    
  for(j=i; j>=gap && arr[j-gap] < temp; j -= gap) {
    arr[j] = arr[j - gap];
    }
    arr[j] = temp;
   }
 }
}

void PrintArrayAsc(List<int> arr) {
print("Hasil Pengurutan Secara Ascending: ");
for (int i = 0; i < arr.length; i++) {
  stdout.write("${arr[i]} ");
}
print("");
}

void PrintArrayDsc(List<int> arr) {
print("Hasil Pengurutan Secara Descending: ");
for (int i = 0; i < arr.length; i++) {
  stdout.write("${arr[i]} ");
}
print("");
}

void main() {
List<int> arr = [12, 11, 13, 5, 6];
ShellSortAsc(arr);
PrintArrayAsc(arr);
ShellSortDsc(arr);
PrintArrayDsc(arr);
}