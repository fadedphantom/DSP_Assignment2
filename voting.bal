import ballerina/io;
import ballerina/log;

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

     
     string[] voters = ["1","2","3"];

    string candidate1 = "1";
    string candidate2 = "2";
    string candidate3 = "3";

    //Total candidate votes
    int nom1_votes = 0;
    int nom2_votes = 0;
    int nom3_votes = 0;    

     foreach var v in voters {       
     

    //Enter voter id
    string voteId = io:readln("Enter voter id: ");

    if(voteId.equalsIgnoreCaseAscii("1")||voteId.equalsIgnoreCaseAscii("2")){

    //Choose candidate name
    string choice = io:readln("Enter candidate number you wish to vote for: ");
    

    if (choice.equalsIgnoreCaseAscii(candidate1)){

        nom1_votes = nom1_votes + 1;
    }  

    if (choice.equalsIgnoreCaseAscii(candidate2)){

        nom2_votes = nom2_votes + 1;
    }   

    if (choice.equalsIgnoreCaseAscii(candidate3)){

        nom3_votes = nom3_votes + 1;
    }
 
    if (nom1_votes > nom2_votes && nom1_votes > nom3_votes){

            io:println("Candidate 1 is leading");
    }

      if (nom2_votes > nom1_votes && nom2_votes > nom3_votes){

            io:println("Candidate 2 is leading");
    }

      if (nom3_votes > nom2_votes && nom3_votes > nom1_votes){

            io:println("Candidate 3 is leading");
    }

    }

    else {

        io:println("You are not a registered voter or have already voted!");
    }
    }
    

    //Determine Winner
    
    if (nom1_votes > nom2_votes && nom1_votes > nom3_votes){

            io:println("Candidate 1 is the winner");
    }

      if (nom2_votes > nom1_votes && nom2_votes > nom3_votes){

            io:println("Candidate 2 is winner");
    }

      if (nom3_votes > nom2_votes && nom3_votes > nom1_votes){

            io:println("Candidate 3 is winner");
    }

     


    

    

  
      // json|error rResult = read("./data.json");

      //   if (rResult is error) {
      //      log:printError("Error occurred while reading json: ",
      //                     err = rResult);
      //  } else {

      //       json|error j = json.constructFrom(rResult);
    
    //if (j is json) {

          //map<anydata>|error movieMap = map<anydata>.constructFrom(rResult);
    //if (movieMap is map<anydata>) {
     //   Voter|error writer = Voter.constructFrom(movieMap["name"]);
     //   if (writer is Voter) {
     //       io:println(writer.name);
     //   }
    //}
     //   io:println(j.toJsonString());
     //   io:println(j.voters.name);
   // }
           // io:println(rResult.toJsonString());
        }

    



    
   
     



