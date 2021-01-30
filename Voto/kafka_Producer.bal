import ballerina/io;
import ballerina/kafka;
import ballerina/log;
import ballerina/lang.'int;

//Allow for the reading of content from a json file
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
//----------------------------------------------------------------------

//Kafka configurations

kafka:ProducerConfiguration producerConfiguration = {
    bootstrapServers: "localhost:9092",
    clientId: "basic-producer",
    acks: "all",
    retryCount: 3
    
};

kafka:Producer kafkaProducer = new (producerConfiguration);


public function main() {

     io:println("The following is a list of all the voters registered in the system: ");

     json|error rResult = read("./data.json");

      if (rResult is error) {
         log:printError("Error occurred while reading json file: ",
                   err = rResult);
       } else {  
    
         io:println(rResult.toJsonString());
       }

    //Enter number of voters to add
    string numVoters = io:readln("Enter number of voters: ");
    int|error totalVoters = 'int:fromString(numVoters);

    //VoterID array for validation purposes
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

     //-----------------------------------------------------------------------------

    io:println("The following is a list of all the candidates registered in the system: ");

    json|error rResult2 = read("./candidate.json");

      if (rResult2 is error) {
         log:printError("Error occurred while reading json: ",
                   err = rResult2);
       } else {  
    
         io:println(rResult2.toJsonString());
        }


     //Enter number of candidates to add
    string numCandidates = io:readln("Enter number of candidates: ");
    int|error totalCandidates= 'int:fromString(numCandidates);
    string[] candidateID = [];

    //Total number of candidates    
    int total_num_Candidates = 0;

    if (totalCandidates is int){

    while(total_num_Candidates < totalCandidates){
        
        string candidateid = io:readln("Enter candidate number: ");
        //Add candidate to array 
        candidateID.push(candidateid);
        total_num_Candidates = total_num_Candidates + 1;

    }

}

     else{

         io:println("Wrong data entry.");
     }

    
    
   //Sending of information
//Send Voter information
    string[]message = voterID;
    byte[] serializedMsg = message.toString().toBytes();
    
    var sendResult = kafkaProducer->send(serializedMsg, "test-kafka-topic");
    if (sendResult is error) {
        io:println("Error occurred while sending data: " + sendResult.toString());
    } else {
        io:println("Message sent successfully.");
    }
    var flushResult = kafkaProducer->flushRecords();
    if (flushResult is error) {
        io:println("Error occurred while flishing the data: " + flushResult.toString());
    } else {
        io:println("Records were flushed successfully.");
    }


//Send candidate information
    string[]message2 = candidateID;
     byte[] serializedMsg2 = message2.toString().toBytes();
    
    var sendResult2 = kafkaProducer->send(serializedMsg2, "test-kafka-topic");
    if (sendResult is error) {
        io:println("Error occurred while sending data: " + sendResult2.toString());
    } else {
        io:println("Message sent successfully.");
    }
    var flushResult2 = kafkaProducer->flushRecords();
    if (flushResult2 is error) {
        io:println("Error occurred while flishing the data: " + flushResult2.toString());
    } else {
        io:println("Records were flushed successfully.");
    }

} 
