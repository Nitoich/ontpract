import os
import sys
countFile = 0
COUNT = 0

directorys = ('KG','KS', 'MDK1101', 'MDK0201', 'MDK0202', 'MDK0203', 'OAIP', 'OPBD')

endFileFormat = '.docx'
 #CurretDirectory = os.path.dirname(sys.argv[0])
showFoundedFile = False
kgo = 37
kso = 4
mdk1101o = 7
mdk0201o = 17
mdk0202o = 10
mdk0203o = 8
oaipo = 33
opbdo = 11

for disc in directorys:
    if (os.path.exists(disc) == False):
        print(disc, 'not founded!')

for disc in directorys:
    print('-----',disc,'-----')
    if disc == 'KG':
        countFile = kgo
        prefixFile = 'KG'
    elif disc == 'KS':
        countFile = kso
        prefixFile = 'KS'
    elif disc == 'MDK1101':
        countFile = mdk1101o
        prefixFile = 'MDK'
    elif disc == 'MDK0201':
        countFile = mdk0201o
        prefixFile = 'MDK'
    elif disc == 'MDK0202':
        countFile = mdk0202o
        prefixFile = 'MDK'
    elif disc == 'MDK0203':
        countFile = mdk0203o
        prefixFile = 'MDK'
    elif disc == 'OAIP':
        countFile = oaipo
        prefixFile = 'OA'
    elif disc == 'OPBD':
        countFile = opbdo
        prefixFile = 'OP'
    for i in range(1,countFile + 1):
        COUNT += 1;
        if os.path.isfile(disc + '/' + prefixFile + str(i) + endFileFormat):
            if showFoundedFile:
                print(i,'+++')
        else:
            print(i,'---')
            #print('/'+disc+'/' + prefixFile + str(i) + endFileFormat)
print(COUNT)