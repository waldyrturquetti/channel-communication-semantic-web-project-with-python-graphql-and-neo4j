import graphene

from app.schema.mutation.create_user import CreateUser

from app.schema.query.get_user import GetUser
from app.schema.query.get_user_commchannels import GetUserCommChannels
from app.schema.query.get_comm_channels_and_comm_resources_by_user import GetCommChannelsAndCommResourcesByUser


class Query(GetUser, GetUserCommChannels, GetCommChannelsAndCommResourcesByUser, graphene.ObjectType):
    pass


class Mutations(CreateUser, graphene.ObjectType):
    pass


schema = graphene.Schema(query=Query, mutation=Mutations)
