//Given an array of integers, return indices of the two numbers
//such that they add up to a specific target.

//You may assume that each input would have exactly one solution.

//Example:
//Given nums = [2, 7, 11, 15], target = 9,

//Because nums[0] + nums[1] = 2 + 7 = 9,
//return [0, 1].

func twoSum(nums []int, target int) []int {
	mp := make(map[int]int)
	for idx, num := range nums {
		if i, exist := mp[target-num]; exist {
			return []int{i, idx}
		}
		mp[num] = idx
	}

	return []int{}
}
