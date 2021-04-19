import os
counter = 0

directorys = ('KG', 'MDK0201', 'MDK0202', 'MDK0203', 'OAIP', 'OPBD')

endFileFormat = '.docx'
showFoundedFile = False
kgo = 37
mdk0201o = 12
mdk0202o = 10
mdk0203o = 8
oaipo = 32
opbdo = 11

for disc in directorys:
    if (os.path.exists(disc) == False):
        print(disc, 'not founded!')

for disc in directorys:
    print('-----',disc,'-----')
    if disc == 'KG':
        for i in range(1,kgo + 1):
            if os.path.isfile(disc+'/KG'+str(i)+endFileFormat):
                if showFoundedFile:
                    print(i,'+++')
            else:
                print(i,'---')
    if disc == 'MDK0201':
        for i in range(1, mdk0201o + 1):
            if os.path.isfile(disc+'/MDK'+str(i)+endFileFormat):
                if showFoundedFile:
                    print(i, '+++')
            else:
                print(i, '---')
