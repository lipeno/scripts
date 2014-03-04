=begin
Challenge 5: Order Task
You are given a set of tasks which are uniquely identified by integer IDs and a set of dependencies that define which tasks must be executed prior to others.
Your task is to
write a function that orders the tasks so that all dependencies are satisfied
print to the standard output (stdout) all ordered task IDs separated by a white space (on a single line)
Note that your function will receive the following arguments:
dependencyFirst
which is an array of integers giving the ID of the task that needs to be executed first in each dependency
dependencySecond
which is an array of integers giving the ID of the task that needs to be executed second in each dependency
totalNumTasks
which is an integer value giving the total number of tasks in the set
The ith dependency is described as follows: the ith task in dependencyFirst must be executed prior to the ith task in dependencySecond.
=end

def order_tasks(dependency_first, dependency_second, total_num_tasks)
  priorities = Hash[dependency_first.zip dependency_second]
  prioritized_tasks = (1..total_num_tasks).to_a

  priorities.each do |priority|
    prioritized_tasks.delete(priority[0])
    index_of_addition = prioritized_tasks.index(priority[1])
    prioritized_tasks.insert(index_of_a ddition, priority[0])
  end
  puts prioritized_tasks.join(" ")
end

order_tasks [3,1,2], [2,2,4], 6