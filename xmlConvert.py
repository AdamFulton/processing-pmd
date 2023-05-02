from bs4 import BeautifulSoup

with open('./output.xml', 'r') as f:
    data = f.read()

Bs_data = BeautifulSoup(data, "xml")

Bs_class = Bs_data.find_all("violation")
Bs_name = Bs_data.find_all("file")

file_names = []
for i in Bs_class:
    name = i["class"].split("$")
    print(name)
    file_names.append(name[1] + ".pde")

for i in range(len(Bs_name)):
   Bs_name[0]["name"] = file_names[0]

for i in range(0,len(Bs_data.find_all("file"))):
    Bs_data.find_all("file")[i]["name"] = file_names[i]



print(Bs_data.prettify())

with open("output.xml", "w") as f:
    f.write(Bs_data.prettify())
    f.close()
