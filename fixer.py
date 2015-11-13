
def main():
	inFile = open ("./Gallups_Most_Important_Problem.csv", "r")
	outFile = open ("./Gallups_Most_Important_Problem_reformatted2.csv", "w")
	topics = {1:"Macroeconomics", 2:"Civil Rights", 3:"Health", 4:"Agriculture", 5:"Labor", 6:"Education", 7:"Environment", 8:"Energy", 9:"Immigration", 10:"Transportation", 12:"Crime", 13:"Social Welfare", 14:"Housing & Development", 15:"Domestic Commerce", 16:"Defense", 17:"Science & Technology", 18:"Foreign Trade", 19:"International Affairs", 20:"Government Operations", 21:"Public Lands", 25:"Don't Know/Other"}
	
	for line in inFile:
		print(line)
		line2 = line.split(",")
		newline = ""
		if line2[3] != "MajorTopic":
			if int(line2[3]) in topics:
				top = topics[int(line2[3])]
				newline = line2[0] + "," + line2[1] + "," + line2[2] + "," + top + "," + line2[4]
			else:				
				newline = line2[0] + "," + line2[1] + "," + line2[2] + "," + "N/A" + "," + line2[4]			 
		else:
			newline = line
		print (newline)
		outFile.write(newline)



	inFile.close()
	outFile.close()
	
main()
