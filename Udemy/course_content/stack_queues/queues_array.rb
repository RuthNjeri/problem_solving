queue = []

queue.push("1") # adding, does not require re-indexing
queue.push("2")
queue.push("3")

queue.shift # removing from beginning # requires reindexing

queue.unshift("1") # adding requires reindexing
queue.unshift("2")
queue.unshift("3")

queue.pop # does not require re-indexing


