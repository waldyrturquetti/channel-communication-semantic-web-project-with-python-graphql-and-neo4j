import graphene

from app.schema.query.get_user import GetUser
from app.schema.query.get_user_commchannels import GetUserCommChannels
from app.schema.mutation.create_user import CreateUser


class Query(GetUser, GetUserCommChannels, graphene.ObjectType):
    pass


class Mutations(CreateUser, graphene.ObjectType):
    pass


schema = graphene.Schema(query=Query, mutation=Mutations)
