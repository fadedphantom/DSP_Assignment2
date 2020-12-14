const axios = require('axios');
const{
    GraphQLObjectType,
    GraphQLString,
    GraphQLInt,
    GraphQLSchema,
    GraphQLList,
    GraphQLNonNull
} = require('graphql');

/*
//Hardcoded
const customers = [
    {id:'1', name:'John Doe', email:'jdoe@gmail.com', age:20},
    {id:'2', name:'Johnn Boe', email:'jboe@gmail.com', age:21},
]
*/

//Voter Type
const VoterType = new GraphQLObjectType({
    name:'Voter_Info',
    fields:() => ({
        id:{type:GraphQLString},
        name:{type:GraphQLString},
        state:{type:GraphQLString},
        age:{type:GraphQLInt},
    })
});

//Root Query 
const RootQuery = new GraphQLObjectType({
    name:'RootQueryType',
    fields:{
        voter:{
            type:VoterType,
            args:{
                id:{type: GraphQLString}
            },
            resolve(parentValue, args){
                /*
                for(let i = 0; i < customers.length; i++){
                    if(customers[i].id == args.id){
                        return customers[i];
                    }
                }
                */

                return axios.get('http://localhost:3000/voters/'+ args.id)
                    .then(res => res.data);
               
            }
        },

        voters:{
            type: new GraphQLList(VoterType),
            resolve(parentValue, args){
                return axios.get('http://localhost:3000/voters')
                .then(res => res.data);
            }
        }
       
    }
   
});

//Mutations
const mutation = new GraphQLObjectType({
    name: 'Mutation',
    fields:{
        addVoter:{
            type: VoterType,
            args:{
                name:{type: new GraphQLNonNull(GraphQLString)},
                state:{type: new GraphQLNonNull(GraphQLString)},
                age:{type: new GraphQLNonNull(GraphQLInt)}
            },
            resolve(parentValue, args){               
                return axios.post('http://localhost:3000/voters', {
                    name: args.name,
                    sate: args.state,
                    age: args.age
                })
                .then(res => res.data)
            }
        },

        deleteVoter:{
            type: VoterType,
            args:{
                id:{type: new GraphQLNonNull(GraphQLString)},
                
            },
            resolve(parentValue, args){               
                return axios.delete('http://localhost:3000/voters/'+args.id)
                .then(res => res.data)
            }
        },

        updateVoter:{
            type: VoterType,
            args:{
                id:{type: new GraphQLNonNull(GraphQLString)},
                name:{type:GraphQLString},
                state:{type:GraphQLString},
                age:{type:GraphQLInt}
            },
            resolve(parentValue, args){               
                return axios.patch('http://localhost:3000/voters/'+args.id, args)
                .then(res => res.data)
            }
        },
    }
})
module.exports = new GraphQLSchema({
    query:RootQuery,
    mutation
});