with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure PlayList is

    -- Define the Person type
    type Person is record
        name : Unbounded_String;
    end record;

    procedure Put_Person (p : Person) is
    begin
        Put (To_String (p.name));
    end Put_Person;

    -- Define a discriminated union type for Item
    type Item_Type is (PIECE, PAUSE);

    type Item (item_variant : Item_Type) is record
        case item_variant is
            when PIECE =>
                name        : Unbounded_String;
                performer   : Person;
                length_secs : Float;
            when PAUSE =>
                pause_duration : Float;  -- Renamed to avoid conflict
        end case;
    end record;

    -- Define a procedure to print the Item
    procedure Put_Item (i : Item) is
    begin
        case i.item_variant is
            when PIECE =>
                Put (To_String (i.name));
                Put (" by ");
                Put_Person (i.performer);
                Put (" (");
                Put (i.length_secs, aft => 1, exp => 0);
                Put ("s)");
            when PAUSE =>
                Put ("Pause (");
                Put (i.pause_duration, aft => 1, exp => 0);
                Put ("s)");
        end case;
    end Put_Item;

    -- Define a piece item
    piece1 : Item (PIECE) :=
       (item_variant => PIECE,
        name => To_Unbounded_String ("Moonlight Sonata"),
        performer => (name => To_Unbounded_String ("Claudio Arrau")),
        length_secs => 17.0*60.0+26.0);

    -- Define a pause item
    pause1 : Item (PAUSE) :=
       (item_variant => PAUSE,
        pause_duration => 5.0);

begin
    -- Print the piece
    Put_Item (piece1);
    Put_Line ("");

    -- Print the pause
    Put_Item (pause1);
    Put_Line ("");
end PlayList;
