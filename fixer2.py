
def main():
	inFile = open ("./Public_Laws.csv", "r")
	outFile = open ("./Public_Laws_reformatted.csv", "w")
	topics = {1:"Macroeconomics", 2:"Civil Rights", 3:"Health", 4:"Agriculture", 5:"Labor", 6:"Education", 7:"Environment", 8:"Energy", 9:"Immigration", 10:"Transportation", 12:"Crime", 13:"Social Welfare", 14:"Housing & Development", 15:"Domestic Commerce", 16:"Defense", 17:"Science & Technology", 18:"Foreign Trade", 19:"International Affairs", 20:"Government Operations", 21:"Public Lands", 25:"Don't Know/Other"}
#	count = 0
	'''	print (inFile.readline())
	test = (inFile.readline())
	test = test.split(",")
	print (test)
	print (inFile.readline())
	print (inFile.readline())'''
	for line in inFile:
		
	#	line = line.strip()
		line2 = line.split(",")
		newline = ""
	#	if line2[8] != "MajorTopic":
	#		print (int(line2[8]))
		if line2[8] != "MajorTopic":
			if int(line2[8]) in topics:
				top = topics[int(line2[8])]
				st = ""
				for i in range (0, (len(line2) - 1)):
					if i == 8:
						st += top + ","
					else:
						st += line2[i] + ","
				st += line2[i + 1]
			else:	
				st = ""
				for i in range (0, (len(line2)-i)):	
				#	if i == len(line2):
				#		newline += line2[i]
					if i == 8:
						st += "N/A" + ","
					else:
		
						st += line2[i] + ","
					#	newline += line2[i] + ","		
					#	newline = line2[0] + "," + line2[1] + "," + line2[2] + "," + "N/A" + "," + line2[4]
				st += line2[i + 1]

			newline = st			 
		else:
			newline = line
			print (newline)
	#	print (newline)
		outFile.write(newline) 

	print(line)
	print (newline)

	inFile.close()
	outFile.close()
	
main()
