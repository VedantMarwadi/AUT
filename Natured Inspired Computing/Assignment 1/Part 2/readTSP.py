import numpy as np
import matplotlib.pyplot as plt

def getTspData(tsp):
    # Open input file
    infile = open(tsp, 'r')

    # Read instance
    name = infile.readline().strip().split()[1]                     # NAME
    type = infile.readline().strip().split()[1]                     # TYPE
    comment = infile.readline().strip().split()[1]                  # COMMENT
    dimension = infile.readline().strip().split()[1]                # DIMENSION
    edge_weight_type = infile.readline().strip().split()[1]         # EDGE_WEIGHT_TYPE
    node_coord_section = []                                         # NODE_COORD_SECTION
    infile.readline()

    # Read node coord section and store its x, y coordinates
    for i in range(0, int(dimension)):
        x, y = infile.readline().strip().split()[1:]
        node_coord_section.append([float(x), float(y)])

    # Close input file
    infile.close()

    # File as dictionary
    return {
        'name': name,
        'type': type,
        'comment': comment,
        'dimension': dimension,
        'edge_weight_type': edge_weight_type,
        'node_coord_section': node_coord_section
    }

def displayTspHeaders(dict):
    print('\nName: ', dict['name'])
    print('Type: ', dict['type'])
    print('Comment: ', dict['comment'])
    print('Dimension: ', dict['dimension'])
    print('Edge Weight Type: ', dict['edge_weight_type'], '\n')
