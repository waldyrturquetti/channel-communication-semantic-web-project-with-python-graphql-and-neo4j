import graphene

from app.repository.user_repository import UserRepository
from app.model.user_entity import User

user_repository = UserRepository()

class GetUserCommChannels(object):
    get_user_commchannels = graphene.Field(User, name=graphene.String())

    def resolve_get_user_commchannels(root, info, name):
        return user_repository.get_user_commchannels(name)