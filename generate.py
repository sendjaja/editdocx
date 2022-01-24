#!bin/python3
from pydriller import Repository

allcommit = []

check = 'NEUR-'

for commit in Repository('../orionrc-fw-ipg-msp430', from_commit="IPG-v86.0", to_commit="IPG-v87.1").traverse_commits():
#    print(commit.hash)
#    print(commit.author.name)
    # print(commit.msg)
   if "NEUR-" in commit.msg:
       allcommit.append(commit.msg+"\n")

# for i in allcommit.split():
#     if i.startswith("NEUR-"):
#         print(i)

print("====commit=====")
print(*allcommit, sep = "\n====commit====\n")
print(len(allcommit))

filter_object = filter(lambda a: 'NEUR-' in a, allcommit)
print(list(filter_object))
#res = [idx for idx in allcommit if idx.startswith(check)]

#print(str(res) + "\n")
