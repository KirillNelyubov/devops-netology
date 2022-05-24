# devops-netology

# Kirill Nelyubov

# Домашнее задание к занятию "7.5. Основы golang"

## Обязательная задача 1

## Обязательная задача 2

## Обязательная задача 3
1. 
       package main
       
       import "fmt"

       func Mtoft(m float64) float64 {
       		return m / 0.3048
       }

       func main() {
           fmt.Print("Enter a number: ")
           var input float64
           fmt.Scanf("%f", &input)
		   fmt.Println(Mtoft(input), "ft")    
       }
2. 
       package main
       
       import "fmt"

       func Least(x []int) int {
           r := 10000
           for i := range x {
               if x[i] < r {
                   r = x[i]
               }
           }
           return r
       }

       func main() {
	       x := []int{48,96,86,68,57,82,63,70,37,34,83,27,19,97,9,17,}
		   fmt.Println(Least(x))    
       }
3. 
       package main
       
       import "fmt"

       func Multiple(n, m int) bool {
		   return (n % m) == 0
       }

       func main() {
           for i := 1; i <= 100; i++ {
			   if Multiple(i,3) { 
			       fmt.Print(i," ")
			   }
		   }
       }
## Обязательная задача 3
1. 
       package main
       import "testing"
       func testMain(t *testing.T) {
           var v float64
           v = Mtoft(float64(3048))
           if v != 10000 {
               t.Error("Expected 10000, got ", v)
           }
       }
2. 
       package main
       import "testing"
       func testMain(t *testing.T) {
           var v int
           v = Least([]int{8,7,4,2,9})
           if v != 2 {
               t.Error("Expected 2, got ", v)
           }
       }
3. 
       package main
       import "testing"
       func testMain(t *testing.T) {
           var v bool
           v = Multiple(88, 4)
           if !v {
               t.Error("Expected true, got ", v)
           }
       }









