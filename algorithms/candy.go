/*
 * https://leetcode.com/problems/candy/
 * There are N children standing in a line. Each child is assigned a rating
 * value. You are giving candies to these children subjected to the following
 * requirements:
 *
 *     + Each child must have at least one candy.
 *     + Children with a higher rating get more candies than their neighbors.
 *
 * What is the minimum candies you must give?
 *
 */
func candy(ratings []int) int {
    size := len(ratings)
    candies := make([]int, size)

    for i := 0; i < size; i++ {
        candies[i] = 1
    }

    for i := 0; i < size-1; i++ {
        if ratings[i+1] > ratings[i] {
            candies[i+1] = candies[i] + 1
        }
    }

    for i := size - 1; i > 0; i-- {
        if ratings[i-1] > ratings[i] && candies[i-1] < candies[i] + 1 {
            candies[i-1] = candies[i] + 1
        }
    }

    var sum = 0
    for i := 0; i < size; i++ {
        sum += candies[i]
    }

    return sum
}
