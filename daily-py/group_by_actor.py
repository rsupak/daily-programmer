import pprint

input = [
  ['The Dark Knight', 'Christian Bale', 'Heath Ledger', 'Aaron Eckhart'],
  ['Pulp Fiction', 'Uma Thurman', 'Samuel L Jackson', 'Bruce Willis'],
  ['Shaft', 'Samuel L Jackson', 'Christian Bale', 'Vanessa Williams'],
  ['Sully', 'Tom Hanks', 'Aaron Eckhart', 'Laura Linney'],
]

def groupByActor(input):
    movie_dict = {}
    for items in input:
        movie_dict[items[0]] = items[1:]

    actors = set()
    for items in movie_dict.values():
        for person in items:
            actors.add(person)

    full_list = []
    for actor in actors:
        movie_list = [actor]
        for movie in movie_dict.keys():
            if actor in movie_dict[movie]:
                movie_list.append(movie)
        if len(movie_list) > 2:
            full_list.append(movie_list)
    return sorted(full_list)

pp = pprint.PrettyPrinter()
x = groupByActor(input)
pp.pprint(x)
