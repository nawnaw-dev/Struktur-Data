import 'dart:io';
//shell sort ascending
void ShellSortAsc(List<int> arr) { 
  
  int n = arr.length;
  for (int gap = n ~/ 2; gap > 0; gap ~/= 2) {
  for (int i = n-gap-1; i >=0; i--) {
    int temp = arr[i];
    int j;
    
  for(j=i; j+gap<n && arr[j+gap] > temp; j += gap) {
    arr[j] = arr[j + gap];
    }
    arr[j] = temp;
   }
 }
}

//shell sort descending
void ShellSortDsc(List<int> arr) { 
  
  int n = arr.length;
  for (int gap = n ~/ 2; gap > 0; gap ~/= 2) {
  for (int i = n-gap-1; i >= 0; i--) {
    int temp = arr[i];
    int j;
    
  for(j=i; j+gap<n && arr[j+gap] < temp; j += gap) {
    arr[j] = arr[j + gap];
    }
    arr[j] = temp;
   }
 }
}

void PrintArrayAsc(List<int> arr) {
print("Hasil Pengurutan Secara Ascending dari kanan ke kiri: ");
for (int i = arr.length - 1; i >= 0; i--) {
  stdout.write("${arr[i]} ");
}
print("");
}

void PrintArrayDsc(List<int> arr) {
print("Hasil Pengurutan Secara Descending dari kanan ke kiri: ");
for (int i = arr.length - 1; i >= 0; i--) {
  stdout.write("${arr[i]} ");
}
print("");
}

void main() {
List<int> arr1 = [12, 11, 13, 5, 6];
List<int> arr2 = List.from(arr1);
ShellSortAsc(arr1);
PrintArrayAsc(arr1);
ShellSortDsc(arr2);
PrintArrayDsc(arr2);
}
