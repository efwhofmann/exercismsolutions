"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language:
https://en.wikipedia.org/wiki/Guido_van_Rossum

This is a module docstring, used to describe the functionality
of a module and its functions and/or classes.
"""

EXPECTED_BAKE_TIME = 40
PREPARATION_TIME = 2


def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    This function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """
    return EXPECTED_BAKE_TIME - elapsed_bake_time  


def preparation_time_in_minutes(number_of_layers):
    """ Calculate the prepation time in minutes
        using the PREPARATION_TIME constant
        :param number_of_layers: int - number of layers to add to the lasagna
        :return: int - preparation for the lasagna

        This function multiplies the PREPARATION_TIME with the number of layers.
    """
    return number_of_layers * PREPARATION_TIME

def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time):
    """ Calculate the time elapsed while prepating the pasta
        :param number_of_layers, elapsed_bake_time: int - number of layers added to the pasta, number of minutes the pasta has spent in the oven
        :return: int - total minutes you have been in the kitchen cooking 

        This function adds the preparation as calculated throuugh perpation_time_in_minutes function to the time the lasagna has already spent in the oven.
    """
    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time

