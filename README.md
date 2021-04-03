# Ascii Canvas Implementation

- Created a mix project, this decision was informed by my implementation of the server side only
- Tests cover the 3 fixtures provided
- Did not fully implement the API i.e sending requests to the endpoint and receiving status codes together with with the data if any
- Due to this we will majorly do, function calls on our console and view the provided output
- This will, in the future, be converted to json that's consumable on the frontend
- I opted to persist rather than cache all the drawings in a table called `drawings` and associate it with the `canvas` table with a one to many relationship. This binds all drawings drawn on a canva to that particular canva
- Important to note, whenever we launch a new canvas, the old one is discarded together with all it's drawings. It's more like the `clear`  button on drawing games
- The drawings and canvas are available across application launches

# Tests
To run the tests, run this on your terminal

`$ mix tests`

## Launching a new Canvas
- Open our console/interpreter within the project:

`$ iex -S mix`

- To launch a new canvas board(our fixed canvas board size is 10 by 10)

`$ AsciiCanvas.launch_canvas()`

- at this point we have a new and clean canvas board of size 10x10. Now we can draw rectangles and flood fills on it

### Drawing Rectangles(With outline only, with fill only or with both outline and fill)

- on the same order as provided on the test fixtures, we pass the parameters to our new function on the AsciiCanvas Module

- for example:
`=>  AsciiCanvas.new([3,2],5,3,"@","x")`

- the above should produce an output that entails the coordinates for both the fill and outline characters in the following format
```
%{
   canvas_id: "c3860331-52a4-4482-8c7c-599daccc0127",
   coordinates: [
     %{char: "@", x: 3, y: 2},
     %{char: "@", x: 3, y: 3},
     %{char: "@", x: 3, y: 4},
     %{char: "@", x: 4, y: 2},
     %{char: "@", x: 4, y: 4},
     %{char: "@", x: 5, y: 2},
     %{char: "@", x: 5, y: 4},
     %{char: "@", x: 6, y: 2},
     %{char: "@", x: 6, y: 4},
     %{char: "@", x: 7, y: 2},
     %{char: "@", x: 7, y: 3},
     %{char: "@", x: 7, y: 4},
     %{char: "x", x: 4, y: 3},
     %{char: "x", x: 5, y: 3},
     %{char: "x", x: 6, y: 3}
    ]
}
```

- this is a clear representation of the coordinates on the canvas where the rectangle lies with respect to the outline and fill characters
- The above can be done for rectangle with or without the outline or fill characters, it's important that one of the two is always present at a given time

### Drawing Flood fills(Excluding the already drawn rectangles)
 When drawing a flood fill I give all the coordinates from the given starting point to the end of the canvas excluding coordinates that have already been filled by either another flood fill or rectangles on that particular canvas

- for example
iex =>  AsciiCanvas.new([3,2], "--")

- this gives us all the filled coordinates from our flood fill starting point excluding all the other drawings made prior on that canvas
```
[
     %{char: "--", x: 3, y: 5}, %{char: "--", x: 3, y: 6},%{char: "--", x: 3, y: 7},
     %{char: "--", x: 3, y: 8}, %{char: "--", x: 3, y: 9}, %{char: "--", x: 3, y: 10},
     %{char: "--", x: 4, y: 5}, %{char: "--", x: 4, y: 6}, %{char: "--", x: 4, y: 7},
     %{char: "--", x: 4, y: 8}, %{char: "--", x: 4, y: 9}, %{char: "--", x: 4, y: 10},
     %{char: "--", x: 5, y: 5}, %{char: "--", x: 5, y: 6}, %{char: "--", x: 5, y: 7},
     %{char: "--", x: 5, y: 8}, %{char: "--", x: 5, y: 9}, %{char: "--", x: 5, y: 10},
     %{char: "--", x: 6, y: 5}, %{char: "--", x: 6, y: 6}, %{char: "--", x: 6, y: 7},
     %{char: "--", x: 6, y: 8}, %{char: "--", x: 6, y: 9}, %{char: "--", x: 6, y: 10},
     %{char: "--", x: 7, y: 5}, %{char: "--", x: 7, y: 6}, %{char: "--", x: 7, y: 7},
     %{char: "--", x: 7, y: 8},  %{char: "--", x: 7, y: 9}, %{char: "--", x: 7, y: 10},
     %{char: "--", x: 8, y: 2}, %{char: "--", x: 8, y: 3}, %{char: "--", x: 8, y: 4},
     %{char: "--", x: 8, y: 5}, %{char: "--", x: 8, y: 6}, %{char: "--", x: 8, y: 7},
     %{char: "--", x: 8, y: 8}, %{char: "--", x: 8, y: 9}, %{char: "--", x: 8, y: 10},
     %{char: "--", x: 9, y: 2}, %{char: "--", x: 9, y: 3}, %{char: "--", x: 9, y: 4},
     %{char: "--", x: 9, y: 5}, %{char: "--", x: 9, y: 6}, %{char: "--", x: 9, y: 7},
     %{char: "--", x: 9, y: 8}, %{char: "--", x: 9, y: 9}, %{char: "--", x: 9, y: 10},
     %{char: "--", x: 10, y: 2}, %{char: "--", x: 10, y: 3}, %{char: "--", x: 10, y: 4},
     %{char: "--", x: 10, y: 5}, %{char: "--", x: 10, y: 6}, %{char: "--", x: 10, y: 7},
     %{char: "--", x: 10, y: 8}, %{char: "--", x: 10, y: 9}, %{char: "--", x: 10, y: 10}
   ]
```

**Assumptions**

- There can only be one canvas in use at a time
- drawing a floodfill from the canvas origin(assumably 0,0) makes it impossible to draw another flood fill

END
- I understand that there's so much to be improved and refactored on this and I look forward to progressing with this give or take the interview outcome.