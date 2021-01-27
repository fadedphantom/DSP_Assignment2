import ballerina/io;
import ballerina/log;
import ballerina/lang.'int;

type Voter record {
    string id;
    string name;
    string state;
    int age;   
};


function closeRc(io:ReadableCharacterChannel rc) {
    var result = rc.close();
    if (result is error) {
        log:printError("Error occurred while closing character stream",
                        err = result);
    }
}

function read(string path) returns @tainted json|error {

    io:ReadableByteChannel rbc = check io:openReadableFile(path);

    io:ReadableCharacterChannel rch = new (rbc, "UTF8");
    var result = rch.readJson();
    closeRc(rch);
    return result;
}


public function main() {

    io:println("The following is a list of all the voters registered in the system: ");

    json|error rResult = read("./data.json");

      if (rResult is error) {
         log:printError("Error occurred while reading json: ",
                   err = rResult);
       } else {  
    
         io:println(rResult.toJsonString());
        }

    //Enter number of voters to add
    string numVoters = io:readln("Enter number of voters: ");
    int|error totalVoters = 'int:fromString(numVoters);
    string[] voterID = [];

    //Total number of voters    
    int total_num_Voters = 0;

    if (totalVoters is int){

    while(total_num_Voters < totalVoters){
        
        string voterid = io:readln("Enter voter id: ");
        //Add voters to array 
        voterID.push(voterid);
        total_num_Voters = total_num_Voters + 1;

    }

}

     else{

         io:println("Wrong data entry.");
     }


     //Enter number of candidates to add
    string numCandidates = io:readln("Enter number of candidates: ");
    int|error totalCandidates= 'int:fromString(numCandidates);
    string[] candidateID = [];

    //Total number of candidates    
    int total_num_Candidates = 0;

    if (totalCandidates is int){

    while(total_num_Candidates < totalCandidates){
        
        string candidateid = io:readln("Enter voter id: ");
        //Add candidate to array 
        candidateID.push(candidateid);
        total_num_Candidates = total_num_Candidates + 1;

    }

}

     else{

         io:println("Wrong data entry.");
     }
     
   

}

    
   
     



