import os

from dotenv import load_dotenv
from neo4j import GraphDatabase

from app.dto.comm_channels_and_comm_resources_dto import serialize_comm_channels_and_comm_resources

load_dotenv()

uri = os.getenv("NEO4J_URI", "bolt://127.0.0.1:7687")
username = os.getenv("NEO4J_USER", "neo4j")
password = os.getenv("NEO4J_PASSWORD", "Str@ngPassword")
database = os.getenv("NEO4J_DATABASE", "neo4j")


class CommChannelRepository:
    def __init__(self):
        self.driver = GraphDatabase.driver(uri, auth=(username, password))

    def close(self):
        self.driver.close()

    @staticmethod
    def _get_user_commchannels(tx, name):
        nodes = tx.run(
            "MATCH (u:User {name:$name})-[:HAVE]->(a)-[:USE]->(cc:ChannelCommunication) RETURN collect(distinct cc)",
            name=name)
        results = [record for record in nodes.data()]
        return results[0]['collect(distinct cc)']

    def get_user_commchannels(self, name):
        with self.driver.session() as session:
            commchannel = session.execute_read(self._get_user_commchannels, name)
            self.close()
            return commchannel

    @staticmethod
    def _get_user_comm_channels_and_comm_resources_by_user(tx, name):
        nodes = tx.run(
            "MATCH path = (u:User {name:$name})-[h:HAVE]->(a)-[*]->(cc:ChannelCommunication)"
            " RETURN u,PROPERTIES(h),a,cc;", name=name)
        return serialize_comm_channels_and_comm_resources(nodes.data())

    def get_user_comm_channels_and_comm_resources_by_user(self, user_name):
        with self.driver.session() as session:
            comm_channel = session.execute_read(self._get_user_comm_channels_and_comm_resources_by_user, user_name)
            self.close()
            return comm_channel
