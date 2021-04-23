# https://leetcode.com/problems/median-of-two-sorted-arrays/
# https://www.youtube.com/watch?v=yD7wV8SyPrc
# https://www.youtube.com/watch?v=q6IEA26hvXc


# BRUTEFORCE
# def find_median_sorted_arrays(nums1, nums2)
#     merged_arr = nums1 + nums2
#     merged_arr.sort!
#     length = nums1.length + nums2.length
#     median = 0
#     if length.odd?
#         median_idx = length/2.0
#         median = merged_arr[median_idx]
#     else 
#         first_median_idx = length/2
#         second_median_idx = length/2 - 1
#         print merged_arr[first_median_idx]
#         print merged_arr[second_median_idx]
#         median = (merged_arr[first_median_idx] + merged_arr[second_median_idx])/2.0
#     end
    
#     median 
# end

# Alternative
# def find_median_sorted_arrays(nums1, nums2)
#     # Merge both arrays
#     pointer_1, pointer_2 = 0, 0
#     median = 0
    
#     merged = []
#     while pointer_1 < nums1.length && pointer_2 < nums2.length
#         if nums1[pointer_1] < nums2[pointer_2]
#             merged << nums1[pointer_1]
#             pointer_1 += 1
#         elsif nums1[pointer_1] > nums2[pointer_2]
#             merged << nums2[pointer_2]
#             pointer_2 += 1
#         else
#             merged << nums1[pointer_1]
#             merged << nums2[pointer_2]
#             pointer_1 += 1
#             pointer_2 += 1
#         end
#     end
  
#     while pointer_2 < nums2.length
#         merged << nums2[pointer_2]
#         pointer_2 += 1
#     end
    
#     while pointer_1 < nums1.length
#         merged << nums1[pointer_1]
#         pointer_1 += 1
#     end
    
#     length  = merged.length
#     print merged
    
#     if length.odd?
#         median_idx = length/2.0
#         median = merged[median_idx]
#     else 
#         first_median_idx = length/2
#         second_median_idx = length/2 - 1
#         print merged[first_median_idx]
#         print merged[second_median_idx]
#         median = (merged[first_median_idx] + merged[second_median_idx])/2.0
#     end
#     median
# end

# Another Alternative
def find_median_sorted_arrays(nums1, nums2)
  # Find the left most nums in nums1 and nums2
  total = nums1.length + nums2.length
  half = total/2
  
  short, long = nums1, nums2
  
  if nums1.length > nums2.length
      short = nums2
      long = nums1
  end
  
  left, right = 0, short.length - 1
  
  if nums1.length > 0
      median = (0 + nums1.length) / 2
      nums2_leftmost = half - median
      while nums1[median] > nums2[nums2_leftmost + 1]
          median = (0 + nums1.length) / 2
          nums2_leftmost = left_most_values - median
          break if nums2_leftmost > nums2.length
      end
  end
  
  print median
  print nums2_leftmost
  
end