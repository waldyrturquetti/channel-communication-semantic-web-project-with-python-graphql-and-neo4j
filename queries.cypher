// Return all nodes
MATCH (n) RETURN n;


// Return all relationships between a specific USER and CONTACT
MATCH (u:User {name:'Julio'})-[r]->(c:Contact) RETURN u,r,c;


// Return all SOURCE from a specific COMMUNICATION CHANNEL
MATCH path = (A)-[:USE]->(cc:ChannelCommunication {type:'E-mail'}) RETURN path;


// Return all ACTION that triggered a specific COMMUNICATION CHANNEL
MATCH path = (a:Action)-[:THROUGH_A]->(cc:ChannelCommunication {type:'DirectMessage'}) RETURN path;


// Return the paths between a specific COMMUNICATION CHANNEL and all USER
MATCH path = (cc:ChannelCommunication {type:'SMS'})<-[*]-(a)<-[:HAVE]-(u:User) RETURN path;
MATCH path = (cc:ChannelCommunication {type:'SMS'})<-[*]-(a)<-[:HAVE]-(u:User) RETURN u;


// Return the paths between a specific USER and the BEST COMMUNICATION CHANNEL
MATCH path = (u:User {name:'Julio'})-[h:HAVE]->(a)-[*]->(cc:ChannelCommunication)
WITH max(h.preference_weight) as maxPreference
MATCH path = (u:User {name:'Julio'})-[h:HAVE]->(a)-[*]->(cc:ChannelCommunication)
WHERE h.preference_weight = maxPreference
return path;


// Return all paths between a specific USER and all COMMUNICATION CHANNEL
MATCH path = (u:User {name:'Della'})-[:HAVE]->(a)-[:USE]->(cc:ChannelCommunication) RETURN path;
MATCH (u:User {name:'Della'})-[:HAVE]->(a)-[:USE]->(cc:ChannelCommunication) RETURN cc;


// Return all paths between a specific CONTACT and all COMMUNICATION CHANNEL
MATCH path = (c:Contact {name:'Joao'})-[:HAVE]->(a)-[:USE]->(cc:ChannelCommunication) RETURN path;
MATCH (c:Contact {name:'Joao'})-[:HAVE]->(a)-[:USE]->(cc:ChannelCommunication) RETURN cc;


// Return all paths between a specific EVENT and all COMMUNICATION CHANNEL
MATCH path = (e:Event {context:'Live performance by a famous band'})-[*]->(a)-[:THROUGH_A]->(cc:ChannelCommunication) RETURN path;
MATCH path = (e:Event {context:'Live performance by a famous band'})-[*]->(a)-[:THROUGH_A]->(cc:ChannelCommunication) RETURN cc;


// Return all paths between any ACTION that triggered a COMMUNICATION CHANNEL
MATCH path = (a:Action)-[:THROUGH_A]->(cc:ChannelCommunication) RETURN path;