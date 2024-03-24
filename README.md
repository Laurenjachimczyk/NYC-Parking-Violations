# Part 1: NYC-Parking-Violations 
How to run the program
1. Start 3 node cluster from Google Cloud account and connect from command line using the external IP of the Manager node (instance-1). Then use su root command and provide password.
2. Navigate to the data folder ``` cd mapreduce-test/mapreduce-test-data/ ``` and create fetch_data.sh with the contents of the script (i.e. using vi is an option). Then run the script ``` bash fetch_data.sh ```. Once the script has finished running, confirm there is a new file in this folder called parking_violations.csv
4. Navigate to the python folder ``` cd mapreduce-test/mapreduce-test-python/ ``` and create a new folder for this project ``` mkdir nycpark ```. Use the test.sh file from existing projects (i.e. logstat) and update the datasource to parking_violations.csv and the folders for the mapper.py and reducer.py to nycpark.
5. Within the nycpark folder, create mapper.py and reducer.py using what we have provided for the project submission.
6. To run the full program, use test.sh and confirm the output. When moving from each question for part 1, the contents of the mapper.py and reducer.py can be updated depending on the question (i.e. What are the most common years and types of cars to be ticketed? requires a different mapper and reducer from When are tickets most likely to be issued?)
