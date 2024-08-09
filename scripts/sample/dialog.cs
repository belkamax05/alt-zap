string[] movies = { "Movie 1", "Movie 2", "Movie 3", "Movie 4", "Movie 5" };
int index = 0;

while (true)
{
    Console.Clear();
    Console.WriteLine("Please pick a movie by using the up and down arrow keys:");

    for (int i = 0; i < movies.Length; i++)
    {
        if (i == index)
        {
            Console.BackgroundColor = ConsoleColor.Gray;
            Console.ForegroundColor = ConsoleColor.Black;
        }

        Console.WriteLine((i + 1) + ": " + movies[i]);

        Console.ResetColor();
    }

    var key = Console.ReadKey(true).Key;

    switch (key)
    {
        case ConsoleKey.UpArrow:
            if (index > 0) index--;
            break;
        case ConsoleKey.DownArrow:
            if (index < movies.Length - 1) index++;
            break;
        case ConsoleKey.Enter:
            Console.WriteLine("\nYou picked: " + movies[index]);
            return;
    }
}