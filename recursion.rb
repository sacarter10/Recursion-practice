def range(start, finish)
  if start == finish
    return [start]
  end

  [start] + range(start+1, finish)
end

def recursive_sum(arr)
  return 0 if arr.count == 0 || arr.empty?

  arr[0] + recursive_sum(arr[1..-1])
end

def iterative_sum(arr)
  sum = 0
  arr.each { |elem| sum += elem}
  sum
end

def recursive_exp_1(base, exp)
  return 1 if exp == 0
  base * recursive_exp_1(base, exp - 1)
end

def recursive_exp_2(base, exp)
  return 1 if exp == 0
  if exp.even?
    return recursive_exp_2(base, exp/2) ** 2
  else
    return base * (recursive_exp_2(base, (exp - 1) / 2) ** 2)
  end
end

def deep_dup(arr)
  copy = []
  arr.each do |elem|
    if elem.is_a?(Array)
      copy << deep_dup(elem)
    else
      copy << elem
    end
  end
  copy
end

def recursive_fib(n)
  return [1] if n == 1
  return [1,1] if n == 2

  fibs = recursive_fib(n-1)
  fibs << fibs[-1] + fibs[-2]
end

def binary_search(arr, target)
  mid = arr.count/2
  return mid if arr[mid] == target
  return nil if arr.count == 1
  if target < arr[mid]
    return binary_search(arr[0..mid-1], target)
  else
    result = binary_search(arr[mid+1..-1], target)
    return result.nil? ? nil : result + mid + 1
  end
end

def make_change(amount, coins = [25,10,5,1])
  return [] if amount == 0
  return nil if coins[-1] > amount
  
  coins.each_with_index do |coin, idx|
    if coin <= amount
      if idx < (coins.count - 2) && (coins[idx] + coins[idx+2]) < 2*coins[idx+1]
        path1 = make_change(amount - coin, coins)
        path2 = make_change(amount - coins[idx+1], coins)
        if path1.count < path2.count
          return [coin] + path1
        else
          return [coins[idx+1]] + path2
        end
      else
        rest = make_change(amount - coin, coins)
        return nil if rest.nil?
        return [coin] + rest
      end
    end
  end
end

def merge_sort(arr)
  return arr if arr.count == 1 #hey it's already sorted!
  first_half = arr[0...arr.count/2]
  second_half = arr[arr.count/2..-1]
  first_half = merge_sort(first_half)
  second_half = merge_sort(second_half)

  merge(first_half, second_half)
end

def merge(arr1, arr2)
  merged = []
  until arr1.empty? || arr2.empty?
    if arr1[0] <= arr2[0]
      merged << arr1.shift
    else
      merged << arr2.shift
    end
  end
  merged += arr1 + arr2
  merged
end

def subsets(arr)
  return [[]] if arr.empty?

  other_subs = subsets(arr[0..-2])

  ret = other_subs.dup

  other_subs.each do |subset|
    new_subset = subset.dup
    new_subset << arr[-1]
    ret << new_subset
  end

  ret
end