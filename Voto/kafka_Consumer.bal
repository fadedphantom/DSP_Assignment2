import ballerina/kafka;
import ballerina/log;
import ballerina/lang.'string;
import ballerina/io;

kafka:ConsumerConfiguration consumerConfigs = {
    bootstrapServers: "localhost:9092",
    groupId: "group-id",

    topics: ["test-kafka-topic"],
    pollingIntervalInMillis: 1000

};

function read(string path) returns @tainted json|error {

    io:ReadableByteChannel rbc = check io:openReadableFile(path);

    io:ReadableCharacterChannel rch = new (rbc, "UTF8");
    var result = rch.readJson();
    
    return result;
}



listener kafka:Consumer consumer = new (consumerConfigs);
service kafkaService on consumer {
    resource function onMessage(kafka:Consumer kafkaConsumer,
            kafka:ConsumerRecord[] records) {

        foreach var kafkaRecord in records {
            processKafkaRecord(kafkaRecord);
        }

        var commitResult = kafkaConsumer->commit();
        if (commitResult is error) {
            log:printError("Error occurred while committing the " +
                "offsets for the consumer ", commitResult);
        }
    }
}

function processKafkaRecord(kafka:ConsumerRecord kafkaRecord) {
    anydata serializedMsg = kafkaRecord.value;
    byte[] a = <byte[]>serializedMsg;
    
    string|error msg = 'string:fromBytes(a);
    anydata key = kafkaRecord.key;
   
    if (msg is string) {
        io:println("Message is: ", msg);
       
}

else {
        log:printError("Error occured during conversion of message data", msg);

}

 anydata serializedMsg2 = kafkaRecord.value;
    byte[] a2 = <byte[]>serializedMsg2;
    
    string|error msg2 = 'string:fromBytes(a2);
    anydata key2 = kafkaRecord.key;
   
    if (msg2 is string) {
        io:println("Message is: ", msg2);
       
}

else {
        log:printError("Error occured during conversion of message data", msg2);

}

}