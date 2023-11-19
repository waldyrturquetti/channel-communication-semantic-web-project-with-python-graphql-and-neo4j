MATCH (n) RETURN n;

MATCH (u:User)-[r]->(c:Contact) RETURN u,c;

MATCH (u:User)-[r]->(c:Contact)-[n:HAVE]->(p) RETURN u,c,p;

MATCH (u:User)-[r]->(c:Contact)-[n:HAVE]->(p)-[t:USE]->(e) RETURN u,c,p,e;

// Retrieve the PATH between the users, contacts direct related to a communication channel
MATCH (cc:ChannelCommunication {type: 'SMS'})
MATCH path = (cc)<-[*]-(u:User)
MATCH path2 = (cc)<-[*]-(c:Contact)
WHERE SINGLE(node IN nodes(path) WHERE node:User) AND NONE(node IN nodes(path) WHERE node:Contact) AND NONE(node IN nodes(path2) WHERE node:User)
RETURN path, path2;

// Retrieve the USERS, CONTACTS direct related to a communication channel
MATCH (cc:ChannelCommunication {type: 'SMS'})
MATCH path = (cc)<-[*]-(u:User)
MATCH path2 = (cc)<-[*]-(c:Contact)
WHERE SINGLE(node IN nodes(path) WHERE node:User) AND NONE(node IN nodes(path) WHERE node:Contact) AND NONE(node IN nodes(path2) WHERE node:User)
RETURN collect(distinct u), collect(distinct c);

// Retrieve the PATH between a contact direct related to a communication channel
MATCH path = (cc:ChannelCommunication {type: 'SMS'})<-[*]-(c:Contact)
WHERE NONE(node IN nodes(path) WHERE node:User)
RETURN path;

// Retrieve the CONTACT direct related to a communication channel
MATCH path = (cc:ChannelCommunication {type: 'SMS'})<-[*]-(c:Contact)
WHERE NONE(node IN nodes(path) WHERE node:User)
RETURN collect(distinct c);

// Retrieve the PATH between a user direct related to a communication channel
MATCH path = (cc:ChannelCommunication {type: 'E-mail'})<-[*]-(u:User)
WHERE SINGLE(node IN nodes(path) WHERE node:User) AND NONE(node IN nodes(path) WHERE node:Contact)
RETURN path;

// Retrieve the USERS direct related to a communication channel
MATCH path = (cc:ChannelCommunication {type: 'E-mail'})<-[*]-(u:User)
WHERE SINGLE(node IN nodes(path) WHERE node:User) AND NONE(node IN nodes(path) WHERE node:Contact)
RETURN collect(distinct u);

// Retrieve the PATH between a SPECIFIC USER to direct related to all channel communication
MATCH path = (u:User {name:'Waldyr'})-[h:HAVE]->(a)-[*]->(cc:ChannelCommunication) RETURN path;

// Retrieve the PATH between a SPECIFIC USER to direct related to Best channel communication
MATCH path = (u:User {name:'Julio'})-[h:HAVE]->(a)-[*]->(cc:ChannelCommunication)
WITH max(h.preference_weight) as maxPreference
MATCH finalPath = (user:User {name:'Julio'})-[have:HAVE]->(resource)-[*]->(cc:ChannelCommunication)
WHERE have.preference_weight = maxPreference
return finalPath;