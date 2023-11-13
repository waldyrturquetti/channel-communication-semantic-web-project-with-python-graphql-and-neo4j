import graphene
from app.repository.user_repository import UserRepository

user_repository = UserRepository()

class User(graphene.ObjectType):
    class Meta:
        interfaces = (graphene.relay.Node,)
    # id = graphene.ID()
    name = graphene.String()
    birthday = graphene.String()
    born_country = graphene.String()
    gender = graphene.String()
    height = graphene.String()


class CreateUser(graphene.Mutation):
    class Input:
        name = graphene.String(required=True)
        birthday = graphene.String(required=True)
        born_country = graphene.String(required=True)
        gender = graphene.String(required=True)
        height = graphene.String(required=False)

    user = graphene.Field(User)

    def mutate(self, info, name, birthday, born_country, gender, height):
        user = User(name=name, birthday=birthday, born_country=born_country, gender=gender, height=height)
        return CreateUser(
            user=user,
        )


class Query(graphene.ObjectType):
    user = graphene.Field(User, name=graphene.String())
    def resolve_user(root, info, name):
        return user_repository.get_user_by_name(name)


class Mutations(graphene.ObjectType):
    create_user = CreateUser.Field()


schema = graphene.Schema(query=Query, mutation=Mutations)
