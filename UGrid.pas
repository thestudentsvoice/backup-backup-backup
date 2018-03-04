unit UGrid;
{
  demonstrates how to use the OnDrawCell event handler of a StringGrid to
  display individual cells according to their contents.
  The use can choose whether to display coloured text or images in the grid.
  The images are stored in an ImageList component
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, ImgList, Vcl.Menus;

type
    comboArray = array[1..26] of string;
    cubeArray = array[1..54] of string;
    DownFaceArray = array[1..9] of integer;
  TGridform = class(TForm)
    UpGrid: TStringGrid;
    FillBtn: TButton;
    ChoiceRG: TRadioGroup;
    FrontGrid: TStringGrid;
    DownGrid: TStringGrid;
    BackGrid: TStringGrid;
    RightGrid: TStringGrid;
    LeftGrid: TStringGrid;
    ExitBtn: TButton;
    Solve: TButton;
    Next: TButton;
    Previous: TButton;
    RubiksLbl: TLabel;
    Solve2: TButton;
    Tutorial: TButton;
    ChooseLbl: TLabel;
    MainMenu: TMainMenu;
    Menu1: TMenuItem;
    TutorialMenu: TMenuItem;
    SolveMenu: TMenuItem;
    ExitMenu: TMenuItem;
    Step1: TButton;
    Step2: TButton;
    Step4: TButton;
    Step3: TButton;
    Step5: TButton;
    Steps: TRadioGroup;
    MovesExplained: TLabel;
    Moves: TMemo;
    Algorithms: TLabel;
    AlgorithmExplained: TLabel;
    Step6: TButton;
    StringColours: TEdit;
    procedure FillBtnClick(Sender: TObject);
    procedure UpGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure ExitBtnClick(Sender: TObject);
    procedure Solve2Click(Sender: TObject);
    procedure TutorialClick(Sender: TObject);
    procedure TutorialMenuClick(Sender: TObject);
    procedure SolveMenuClick(Sender: TObject);
    procedure ExitMenuClick(Sender: TObject);
    procedure Step1Click(Sender: TObject);
    procedure Step2Click(Sender: TObject);
    procedure NextClick(Sender: TObject);
    procedure PreviousClick(Sender: TObject);
    procedure Step3Click(Sender: TObject);
    procedure Step4Click(Sender: TObject);
    procedure Step5Click(Sender: TObject);
    procedure Step6Click(Sender: TObject);
  private
    grid: tstringgrid;
    combinations: comboArray;
    cubes: cubeArray;
    n: integer;
    downFace: DownFaceArray;
  public
    { Public declarations }
  end;

var
  Gridform: TGridform;

implementation

{$R *.dfm}

procedure cubie(sender: TObject; combinations: comboArray; Cubes: cubeArray; grid: TStringGrid);
var
  i:integer;
  GridName: string;
begin
  gridname:= (sender as TStringGrid).name;
  if gridName = 'UpGrid' then

  for i := 1 to 26 do
  case i of
   1: combinations[i]:= 'w';
   2: combinations[i]:= 'y';
   3: combinations[i]:= 'o';
   4: combinations[i]:= 'r';
   5: combinations[i]:= 'g';
   6: combinations[i]:= 'b';

   7: combinations[i]:= 'wg';
   8: combinations[i]:= 'wr';
   9: combinations[i]:= 'wb';
  10: combinations[i]:= 'wo';

  11: combinations[i]:= 'og';
  12: combinations[i]:= 'gr';
  13: combinations[i]:= 'rb';
  14: combinations[i]:= 'bo';

  15: combinations[i]:= 'yg';
  16: combinations[i]:= 'yr';
  17: combinations[i]:= 'yb';
  18: combinations[i]:= 'yo';

  19: combinations[i]:= 'wrg';
  20: combinations[i]:= 'wrb';
  21: combinations[i]:= 'wbo';
  22: combinations[i]:= 'wog';

  23: combinations[i]:= 'yrg';
  24: combinations[i]:= 'yrb';
  25: combinations[i]:= 'yob';
  26: combinations[i]:= 'yog';
  end;

  for i := 1 to 54 do
  case i of
   1: cubes[i]:= 'U1';
   2: cubes[i]:= 'U2';
   3: cubes[i]:= 'U3';
   4: cubes[i]:= 'U4';
   5: cubes[i]:= 'U5';
   6: cubes[i]:= 'U6';
   7: cubes[i]:= 'U7';
   8: cubes[i]:= 'U8';
   9: cubes[i]:= 'U9';

  10: cubes[i]:= 'D1';
  11: cubes[i]:= 'D2';
  12: cubes[i]:= 'D3';
  13: cubes[i]:= 'D4';
  14: cubes[i]:= 'D5';
  15: cubes[i]:= 'D6';
  16: cubes[i]:= 'D7';
  17: cubes[i]:= 'D8';
  18: cubes[i]:= 'D9';

  19: cubes[i]:= 'B1';
  20: cubes[i]:= 'B2';
  21: cubes[i]:= 'B3';
  22: cubes[i]:= 'B4';
  23: cubes[i]:= 'B5';
  24: cubes[i]:= 'B6';
  25: cubes[i]:= 'B7';
  26: cubes[i]:= 'B8';
  27: cubes[i]:= 'B9';

  28: cubes[i]:= 'F1';
  29: cubes[i]:= 'F2';
  30: cubes[i]:= 'F3';
  31: cubes[i]:= 'F4';
  32: cubes[i]:= 'F5';
  33: cubes[i]:= 'F6';
  34: cubes[i]:= 'F7';
  35: cubes[i]:= 'F8';
  36: cubes[i]:= 'F9';

  37: cubes[i]:= 'L1';
  38: cubes[i]:= 'L2';
  39: cubes[i]:= 'L3';
  40: cubes[i]:= 'L4';
  41: cubes[i]:= 'L5';
  42: cubes[i]:= 'L6';
  43: cubes[i]:= 'L7';
  44: cubes[i]:= 'L8';
  45: cubes[i]:= 'L9';

  46: cubes[i]:= 'R1';
  47: cubes[i]:= 'R2';
  48: cubes[i]:= 'R3';
  49: cubes[i]:= 'R4';
  50: cubes[i]:= 'R5';
  51: cubes[i]:= 'R6';
  52: cubes[i]:= 'R7';
  53: cubes[i]:= 'R8';
  54: cubes[i]:= 'R9';
  end;

end;

procedure TGridform.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TGridform.ExitMenuClick(Sender: TObject);
begin
  close;
end;

procedure TGridform.FillBtnClick(Sender: TObject);
//fill grid with random integers
// a stringgrid has a Cells property, essentially a 2D array of strings
var
  i, j: Integer;
begin
 with Grid do
  begin
    for i := 0 to 8 do
      for j := 0 to 8 do
        Cells[i, j] := inttostr(random(6));
 end;
end;

procedure TGridform.NextClick(Sender: TObject);
var
  i, j: Integer;
begin
 with Grid do
  begin
    for i := 0 to 8 do
      for j := 0 to 8 do
        Cells[i, j] := inttostr(random(6));
 end;
Previous.enabled:=true;
steps.ItemIndex:= steps.ItemIndex+1;
  case MovesExplained.caption[6] of
       ' ':
       begin
         Steps.ItemIndex:=0;
         MovesExplained.caption:='Step 1: ';
         AlgorithmExplained.caption:='Make a white cross on the top of your cube. Try and position the white ' +
         'middle pieces so that they match the middle of the face below. If your cube looks like this, with a ' +
         'white middle piece in the right place but the wrong orientation then, follow the algorithm below:';
         Algorithms.Caption:='R" U F" U"'
       end;
       '1':
       begin
         Steps.ItemIndex:=1;
         MovesExplained.caption:= 'Step 2:';
         AlgorithmExplained.caption:='Position and orientate the white corners. If you have a cube in the same orientation/positioning as the ' +
         'orange/green/white cube then follow the first algorithm below. If you have a cube in the same orientation/positioning as the green/white/red '+
         'cube then follow the second algorithm below. If you have a cube in the same orientation/positioning as the blue/red/white cube then ' +
         'follow the last algorithm below.';
         Algorithms.Caption:= 'R" D" R      or     F D F"     or      R" D2 R D R" D" R';
       end;
       '2':
       begin
         MovesExplained.caption:= 'Step 3:';
         Steps.ItemIndex:=2;
         AlgorithmExplained.caption:='Flip the cube so the white face is on the base. The next step is to solve the second layer. '  +
         'Rotate the top race of your cube until you have a T-shape on one of the faces. If you have a cube in the same positioning ' +
         'as the red/blue cube - wanting to place it to the right of where it is, then follow the first algorithm below. If you have ' +
         'a cube in the same positioning as the orange/green cube - wanting to place it to the left of where it is, then follow the second algorithm below.' +
         'Repeat these steps on each face until it is only the top layer that is unsolved.';
         Algorithms.Caption:= 'U R U" R" U" F" U F      or      U" L" U L U F U" F"';
       end;
      '3':
      begin
         MovesExplained.caption:= 'Step 4:';
         Steps.ItemIndex:=3;
         AlgorithmExplained.caption:='Yellow cross. With the white face on the base, follow the first algorithm below until there is a yellow cross on top. '+
         'Once there is a cross rotate the top face until at least 2 of the middles match the faces below. If all 4 middles match, proceed to step 5. '+
         'If two middles do not match and are on adjacent faces (such as orange/green) rotate the cube so that you have a wrong middle on the front face ' +
         'and a right middle middle on the right face, then follow the second algorithm below. If two middles do not match are opposite each other (such '+
         'as red/orange) rotate the cube so that you have a wrong middle on the front face and a right middle on the right face, then follow the second ' +
         'algorithm below. Then rotate the top face until 2 faces match again, and repeat the second algorithm until all middles are correct.';
         Algorithms.Caption:= 'F R U R" U" F"      then       R U R" U R U2 R" U';
       end;
      '4':
      begin
         MovesExplained.caption:= 'Step 5:';
         Steps.ItemIndex:=4;
         AlgorithmExplained.caption:='Position the yellow corners. If there is a correctly positioned corner already - like ' +
         'the red/blue/yellow one shown below - then position the cube in your hands so that this cubbe is in the front right ' +
         'corner, then follow the algorithm below. If none of the corners are correct then follow the algorithms as many times ' +
         'as necessary to position all corners correctly.';
         Algorithms.Caption:= 'U R U" L" U R" U" L';
       end;
      '5':
      begin
         MovesExplained.caption:= 'Step 6:';
         Steps.ItemIndex:=5;
         AlgorithmExplained.caption:='Orientate the yellow corners. For each corner on the yellow face, repeat the algorithm '+
         'below as may times as necessary to orientate that corner correctly, then rotate the top face to the next corner and repeat '+
         'until your cube is solved.';
         Algorithms.Caption:= 'R" D" R D';
         Next.Enabled:=false;
       end;
      '6': Next.Enabled:=false;
  end;
end;

procedure TGridform.PreviousClick(Sender: TObject);
var
  i, j: Integer;
begin
 with Grid do
  begin
    for i := 0 to 8 do
      for j := 0 to 8 do
        Cells[i, j] := inttostr(random(6));
 end;
 next.Enabled:=true;
 steps.ItemIndex:= steps.ItemIndex-1;
  case MovesExplained.caption[6] of
       ' ':  Previous.Enabled := False;
       '1': Previous.Enabled := False;
       '2':
       begin
         MovesExplained.caption:='Step 1: ';
         Steps.ItemIndex:=0;
         AlgorithmExplained.caption:='Make a white cross on the top of your cube. Try and position the white ' +
         'middle pieces so that they match the middle of the face below. If your cube looks like this, with a ' +
         'white middle piece in the right place but the wrong orientation then, follow the algorithm below:';
         Algorithms.Caption:='R" U F" U"' ;
         Previous.Enabled := False;
       end;
       '3':
       begin
         MovesExplained.caption:= 'Step 2:';
         Steps.ItemIndex:=1;
         AlgorithmExplained.caption:='Position and orientate the white corners. If you have a cube in the same orientation/positioning as the ' +
         'orange/green/white cube then follow the first algorithm below. If you have a cube in the same orientation/positioning as the green/white/red '+
         'cube then follow the second algorithm below. If you have a cube in the same orientation/positioning as the blue/red/white cube then ' +
         'follow the last algorithm below.';
         Algorithms.Caption:= 'R" D" R      or     F D F"     or      R" D2 R D R" D" R';
       end;
      '4':
       begin
         MovesExplained.caption:= 'Step 3:';
         Steps.ItemIndex:=2;
         AlgorithmExplained.caption:='Flip the cube so the white face is on the base. The next step is to solve the second layer. '  +
         'Rotate the top race of your cube until you have a T-shape on one of the faces. If you have a cube in the same positioning ' +
         'as the red/blue cube - wanting to place it to the right of where it is, then follow the first algorithm below. If you have ' +
         'a cube in the same positioning as the orange/green cube - wanting to place it to the left of where it is, then follow the second algorithm below.' +
         'Repeat these steps on each face until it is only the top layer that is unsolved.';
         Algorithms.Caption:= 'U R U" R" U" F" U F      or      U" L" U L U F U" F"';
       end;
      '5':
       begin
         MovesExplained.caption:= 'Step 4:';
         Steps.ItemIndex:=3;
         AlgorithmExplained.caption:='Yellow cross. With the white face on the base, follow the first algorithm below until there is a yellow cross on top. '+
         'Once there is a cross rotate the top face until at least 2 of the middles match the faces below. If all 4 middles match, proceed to step 5. '+
         'If two middles do not match and are on adjacent faces (such as orange/green) rotate the cube so that you have a wrong middle on the front face ' +
         'and a right middle middle on the right face, then follow the second algorithm below. If two middles do not match are opposite each other (such '+
         'as red/orange) rotate the cube so that you have a wrong middle on the front face and a right middle on the right face, then follow the second ' +
         'algorithm below. Then rotate the top face until 2 faces match again, and repeat the second algorithm until all middles are correct.';
         Algorithms.Caption:= 'F R U R" U" F"      then       R U R" U R U2 R" U';
       end;
      '6':
       begin
         MovesExplained.caption:= 'Step 5:';
         Steps.ItemIndex:=4;
         AlgorithmExplained.caption:='Position the yellow corners. If there is a correctly positioned corner already - like ' +
         'the red/blue/yellow one shown below - then position the cube in your hands so that this cubbe is in the front right ' +
         'corner, then follow the algorithm below. If none of the corners are correct then follow the algorithms as many times ' +
         'as necessary to position all corners correctly.';
         Algorithms.Caption:= 'U R U" L" U R" U" L';
       end;
  end;
end;

procedure TGridform.Solve2Click(Sender: TObject);
var
   i: integer;
begin
  RubiksLbl.Visible:=false;
  Solve2.Visible:=false;
  Tutorial.Visible:=false;
  ChooseLbl.Visible:=false;
  for I := 0 to 5 do
      begin
         case i of
              0: Grid:= UpGrid;
              1: Grid:= DownGrid;
              2: Grid:= FrontGrid;
              3: Grid:= BackGrid;
              4: Grid:= RightGrid;
              5: Grid:= LeftGrid;
         end;
      Grid.Visible:=true;
      {Grid.Enabled:=true;}
      end;
  FillBtn.Visible:=true;
  ExitBtn.Visible:=true;
  Solve.Visible:=true;
  Next.Visible:=true;
  Previous.Visible:=true;
  ChoiceRG.Visible:=true;
  Step1.Visible:=false;
  Step2.Visible:=false;
  Step3.Visible:=false;
  Step4.Visible:=false;
  Step5.Visible:=false;
  Step6.Visible:=false;
  MovesExplained.visible:=false;
  AlgorithmExplained.visible:=false;
  Moves.Visible:=true;
  Steps.ItemIndex:=-1;
  ChoiceRG.ItemIndex:=0;
  Algorithms.Caption :=' ';
  StringColours.Visible:=true;
end;

procedure TGridform.SolveMenuClick(Sender: TObject);
var
   i: integer;
begin
  RubiksLbl.Visible:=false;
  Solve2.Visible:=false;
  Tutorial.Visible:=false;
  ChooseLbl.Visible:=false;
  for I := 0 to 5 do
      begin
         case i of
              0: Grid:= UpGrid;
              1: Grid:= DownGrid;
              2: Grid:= FrontGrid;
              3: Grid:= BackGrid;
              4: Grid:= RightGrid;
              5: Grid:= LeftGrid;
         end;
         Grid.Visible:=true;
        { Grid.Enabled:=true;}
      end;
  ChoiceRG.Enabled:=true;
  FillBtn.Visible:=true;
  ExitBtn.Visible:=true;
  Solve.Visible:=true;
  Next.Visible:=true;
  Previous.Visible:=true;
  ChoiceRG.Visible:=true;
  Step1.Visible:=false;
  Step2.Visible:=false;
  Step3.Visible:=false;
  Step4.Visible:=false;
  Step5.Visible:=false;
  Step6.Visible:=false;
  MovesExplained.visible:=false;
  AlgorithmExplained.visible:=false;
  Moves.Visible:=true;
  Steps.ItemIndex:=-1;
  ChoiceRG.ItemIndex:=0;
  Algorithms.Caption :=' ';
  StringColours.Visible:=true;
end;

procedure TGridform.Step1Click(Sender: TObject);
var
  i, j: Integer;
begin
Next.Enabled:=True;
Steps.ItemIndex:=0;
 with Grid do
  begin
    for i := 0 to 8 do
      for j := 0 to 8 do
        Cells[i, j] := inttostr(random(6));
 end;
 MovesExplained.caption:='Step 1:';
 AlgorithmExplained.caption:='Make a white cross on the top of your cube. Try and position the white ' +
 'middle pieces so that they match the middle of the face below. If your cube looks like this, with a ' +
 'white middle piece in the right place but the wrong orientation then, follow the algorithm below:';
 Algorithms.Caption:='R" U F" U"'
end;

procedure TGridform.Step2Click(Sender: TObject);
var
  i, j: Integer;
begin
Steps.ItemIndex:=1;
Next.Enabled:=true;
Previous.Enabled:=true;
 with Grid do
  begin
    for i := 0 to 8 do
      for j := 0 to 8 do
        Cells[i, j] := inttostr(random(6));
 end;
     MovesExplained.caption:= 'Step 2:';
     AlgorithmExplained.caption:='Position and orientate the white corners. If you have a cube in the same orientation/positioning as the ' +
     'orange/green/white cube then follow the first algorithm below. If you have a cube in the same orientation/positioning as the green/white/red '+
     'cube then follow the second algorithm below. If you have a cube in the same orientation/positioning as the blue/red/white cube then ' +
     'follow the last algorithm below.';
     Algorithms.Caption:= 'R" D" R      or     F D F"     or      R" D2 R D R" D" R';
end;

procedure TGridform.Step3Click(Sender: TObject);
var
  i, j: Integer;
begin
Steps.ItemIndex:=2;
Next.Enabled:=true;
Previous.Enabled:=true;
 with Grid do
  begin
    for i := 0 to 8 do
      for j := 0 to 8 do
        Cells[i, j] := inttostr(random(6));
 end;
     MovesExplained.caption:= 'Step 3:';
     AlgorithmExplained.caption:='Flip the cube so the white face is on the base. The next step is to solve the second layer. '  +
         'Rotate the top race of your cube until you have a T-shape on one of the faces. If you have a cube in the same positioning ' +
         'as the red/blue cube - wanting to place it to the right of where it is, then follow the first algorithm below. If you have ' +
         'a cube in the same positioning as the orange/green cube - wanting to place it to the left of where it is, then follow the second algorithm below.' +
         'Repeat these steps on each face until it is only the top layer that is unsolved.';
         Algorithms.Caption:= 'U R U" R" U" F" U F      or      U" L" U L U F U" F"';
end;

procedure TGridform.Step4Click(Sender: TObject);
var
  i, j: Integer;
begin
Steps.ItemIndex:=3;
Next.Enabled:=true;
Previous.Enabled:=true;
 with Grid do
  begin
    for i := 0 to 8 do
      for j := 0 to 8 do
        Cells[i, j] := inttostr(random(6));
 end;
     MovesExplained.caption:= 'Step 4:';
     AlgorithmExplained.caption:='Yellow cross. With the white face on the base, follow the first algorithm below until there is a yellow cross on top. '+
         'Once there is a cross rotate the top face until at least 2 of the middles match the faces below. If all 4 middles match, proceed to step 5. '+
         'If two middles do not match and are on adjacent faces (such as orange/green) rotate the cube so that you have a wrong middle on the front face ' +
         'and a right middle middle on the right face, then follow the second algorithm below. If two middles do not match are opposite each other (such '+
         'as red/orange) rotate the cube so that you have a wrong middle on the front face and a right middle on the right face, then follow the second ' +
         'algorithm below. Then rotate the top face until 2 faces match again, and repeat the second algorithm until all middles are correct.';
         Algorithms.Caption:= 'F R U R" U" F"      then       R U R" U R U2 R" U';
end;

procedure TGridform.Step5Click(Sender: TObject);
var
  i, j: Integer;
begin
Steps.ItemIndex:=4;
Next.Enabled:=true;
Previous.Enabled:=true;
 with Grid do
  begin
    for i := 0 to 8 do
      for j := 0 to 8 do
        Cells[i, j] := inttostr(random(6));
 end;
     MovesExplained.caption:= 'Step 5:';
     AlgorithmExplained.caption:='Position the yellow corners. If there is a correctly positioned corner already - like ' +
     'the red/blue/yellow one shown below - then position the cube in your hands so that this cubbe is in the front right ' +
     'corner, then follow the algorithm below. If none of the corners are correct then follow the algorithms as many times ' +
     'as necessary to position all corners correctly.';
     Algorithms.Caption:= 'U R U" L" U R" U" L';
end;

procedure TGridform.Step6Click(Sender: TObject);
var
  i, j: Integer;
begin
Steps.ItemIndex:=5;
Next.Enabled:=false;
Previous.Enabled:=true;
 with Grid do
  begin
    for i := 0 to 8 do
      for j := 0 to 8 do
        Cells[i, j] := inttostr(random(6));
 end;
     MovesExplained.caption:= 'Step 6:';
     AlgorithmExplained.caption:='Orientate the yellow corners. For each corner on the yellow face, repeat the algorithm '+
     'below as may times as necessary to orientate that corner correctly, then rotate the top face to the next corner and repeat '+
     'until your cube is solved.';
     Algorithms.Caption:= 'R" D" R D';
end;

procedure TGridform.TutorialClick(Sender: TObject);
begin
  ChoiceRG.ItemIndex:=-1;
  RubiksLbl.Visible:=false;
  Solve2.Visible:=false;
  Tutorial.Visible:=false;
  ChooseLbl.Visible:=false;
  UpGrid.Visible:=true;
  DownGrid.Visible:=true;
  BackGrid.Visible:=true;
  FrontGrid.Visible:=true;
  RightGrid.Visible:=true;
  LeftGrid.Visible:=true;
  ExitBtn.Visible:=true;
  Solve.Visible:=false;
  Next.Visible:=true;
  Previous.Visible:=true;
  Step1.Visible:=true;
  Step2.Visible:=true;
  Step3.Visible:=true;
  Step4.Visible:=true;
  Step5.Visible:=true;
  Step6.Visible:=true;
  Moves.Visible:=true;
  MovesExplained.visible:=true;
  Algorithms.visible:=true;
  AlgorithmExplained.visible:=true;
end;

procedure TGridform.TutorialMenuClick(Sender: TObject);
begin
  ChoiceRG.ItemIndex:=-1;
  RubiksLbl.Visible:=false;
  Solve2.Visible:=false;
  Tutorial.Visible:=false;
  ChooseLbl.Visible:=false;
  UpGrid.Visible:=true;
  DownGrid.Visible:=true;
  BackGrid.Visible:=true;
  FrontGrid.Visible:=true;
  RightGrid.Visible:=true;
  LeftGrid.Visible:=true;
  ExitBtn.Visible:=true;
  Solve.Visible:=false;
  Next.Visible:=true;
  Previous.Visible:=true;
  Step1.Visible:=true;
  Step2.Visible:=true;
  Step3.Visible:=true;
  Step4.Visible:=true;
  Step5.Visible:=true;
  Step6.Visible:=true;
  MovesExplained.visible:= true;
  Algorithms.visible:=true;
  AlgorithmExplained.visible:=true;
end;

procedure TGridform.UpGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
// called whenever a cell is drawn, ACol and ARow are column and row number of cell
// Rect is rectangle bounding cell
var
  value, i, j, n: Integer;
  GridName: string;
begin
  value := 0;
  gridname:= (sender as TStringGrid).name;
  case GridName[1] of
   'U': Grid:= UpGrid;
   'D': Grid:= DownGrid;
   'F': Grid:= FrontGrid;
   'B': Grid:= BackGrid;
   'R': Grid:= RightGrid;
   'L': Grid:= LeftGrid;
  end;
  with Grid do
  begin
    if Cells[ACol, ARow] <> '' then      // get cell contents and convert to integer
      value := strtoint(Cells[ACol, ARow]);
    case ChoiceRG.ItemIndex of  //find out what the user has chosen
      0:
      begin
        with Upgrid do
        begin
          Canvas.Brush.Color:=ClYellow;
          canvas.FillRect(Rect);
        end;
        with Downgrid do
        begin
          Canvas.Brush.Color:=ClWhite;
          canvas.FillRect(Rect);
        end;
        with Frontgrid do
        begin
          Canvas.Brush.Color:=ClBlue;
          canvas.FillRect(Rect);
        end;
        with Backgrid do
        begin
          Canvas.Brush.Color:=ClGreen;
          canvas.FillRect(Rect);
        end;
        with Rightgrid do
        begin
          Canvas.Brush.Color:=ClRed;
          canvas.FillRect(Rect);
        end;
        with Leftgrid do
        begin
          Canvas.Brush.Color:=rgb(254,156,24);
          canvas.FillRect(Rect);
        end;
      end;

      1:begin
        case value of
            0: Canvas.Brush.Color := clwhite;
            1: Canvas.Brush.Color := clred;
            2: Canvas.Brush.Color:= rgb(254,156,24);
            3: Canvas.Brush.Color := clyellow;
            4: Canvas.Brush.Color := clgreen;
            5: Canvas.Brush.Color := clblue;
        end;
      end;
      2: Canvas.Brush.Color := clwhite;
      3: Canvas.Brush.Color := clred;
      4: Canvas.Brush.Color:= rgb(254,156,24);
      5: Canvas.Brush.Color := clyellow;
      6: Canvas.Brush.Color := clgreen;
      7: Canvas.Brush.Color := clblue;
    end;   //case ChoiceRG.ItemIndex
     canvas.FillRect(Rect);
  end;  //with

  case Steps.ItemIndex of
       0:
       begin
       for I := 0 to 5 do
        begin
         case i of
              0: Grid:= UpGrid;
              1: Grid:= DownGrid;
              2: Grid:= FrontGrid;
              3: Grid:= BackGrid;
              4: Grid:= RightGrid;
              5: Grid:= LeftGrid;
         end;
          with Grid do
          begin
               Canvas.Brush.Color:=rgb(225,225,225);
               canvas.FillRect(Rect);
          end;
        end;
       if (ACol = 1) and (ARow = 1) then
         Begin
          with Upgrid do
          begin
               Canvas.Brush.Color:=ClYellow;
               canvas.FillRect(Rect);
          end;
          with Downgrid do
          begin
               Canvas.Brush.Color:=ClWhite;
               canvas.FillRect(Rect);
          end;
          with Frontgrid do
          begin
               Canvas.Brush.Color:=ClBlue;
               canvas.FillRect(Rect);
          end;
          with Backgrid do
          begin
               Canvas.Brush.Color:=ClGreen;
               canvas.FillRect(Rect);
          end;
          with Rightgrid do
          begin
               Canvas.Brush.Color:=ClRed;
               canvas.FillRect(Rect);
          end;
          with Leftgrid do
          begin
               Canvas.Brush.Color:=rgb(254,156,24);
               canvas.FillRect(Rect);
          end;
         End;
       if (ACol = 2) and (ARow = 1) then
         with Downgrid do
          begin
               Canvas.Brush.Color:=ClBlue;
               canvas.FillRect(Rect);
          end;
       if (ACol = 0) and (ARow = 1) then
         with RightGrid do
          begin
               Canvas.Brush.Color:=ClWhite;
               canvas.FillRect(Rect);
          end;
       end;

       1:
       begin
        with UpGrid do
          begin
          if ((ACol=2) and (ARow= 0)) then
               Canvas.Brush.Color:=clwhite
          else if (ACol <> 1) or (ARow <> 1) then
               Canvas.Brush.Color:=rgb(225,225,225)
          else
               Canvas.Brush.Color:=clYellow;
               canvas.FillRect(Rect);
          end;
       for I := 1 to 5 do
        begin
         case i of
              1: Grid:= DownGrid;
              2: Grid:= FrontGrid;
              3: Grid:= BackGrid;
              4: Grid:= RightGrid;
              5: Grid:= LeftGrid;
         end;
          with Grid do
          begin
               Canvas.Brush.Color:=rgb(225,225,225);
               canvas.FillRect(Rect);
          end;
        end;
       if ((ACol = 1) or (ARow = 1)) then
        with Downgrid do
          begin
               Canvas.Brush.Color:=ClWhite;
               canvas.FillRect(Rect);
          end;
       with RightGrid do
          begin
          if ((ACol = 0) and (ARow = 1)) or ((Acol = 1) and (ARow = 1)) or ((ACol = 2) and (ARow = 0)) then
               Canvas.Brush.Color:=ClRed;
          if ((Acol = 2) and (ARow = 2)) then
               Canvas.Brush.Color:=ClBlue;
          canvas.FillRect(Rect);
          end;
       with Backgrid do
          begin
          if ((ACol = 1) and (ARow = 2)) or ((Acol = 1) and (ARow = 1)) then
               Canvas.Brush.Color:=ClGreen;
          if ((ACol = 0) and (Arow = 0)) then
               Canvas.Brush.Color:=ClWhite;
          canvas.FillRect(Rect);
          end;
       with Leftgrid do
          begin
          if ((ACol = 2) and (ARow = 1)) or ((Acol = 1) and (ARow = 1)) or ((ACol = 0) and (ARow = 0)) then
               Canvas.Brush.Color:=rgb(254,156,24);
          canvas.FillRect(Rect);
          end;
       with FrontGrid do
          begin
          if ((ACol = 1) and (ARow = 0)) or ((Acol = 1) and (ARow = 1)) then
               Canvas.Brush.Color:=ClBlue;
          if ((Acol = 2) and (ARow = 2)) then
               Canvas.Brush.Color:=ClRed;
          canvas.FillRect(Rect);
          end;
       end;

      2:
      begin
        with Downgrid do
          begin
               Canvas.Brush.Color:=ClWhite;
               canvas.FillRect(Rect);
          end;
      for I := 2 to 5 do
        begin
         case i of
              2: Grid:= frontGrid;
              3: Grid:= BackGrid;
              4: Grid:= RightGrid;
              5: Grid:= LeftGrid;
         end;
          with Grid do
          begin
               Canvas.Brush.Color:=rgb(225,225,225);
               canvas.FillRect(Rect);
          end;
        end;
      with upGrid do
         begin
              if ((ACol = 1) and (ARow = 0)) then
                   Canvas.Brush.Color:=clRed
              else if ((ACol = 0) and (ARow = 1)) then
                   Canvas.Brush.Color:=clGreen
              else if (ACol <> 1) or (ARow <> 1) then
                   Canvas.Brush.Color:=rgb(225,225,225)
              else
                   Canvas.Brush.Color:=clYellow;
              canvas.FillRect(Rect);
         end;
      with RightGrid do
          begin
          if (ACol = 0) or  ((ACol = 1) and (ARow = 1))  then
               Canvas.Brush.Color:=ClRed;
          canvas.FillRect(Rect);
          end;
      with Backgrid do
          begin
          if (ARow = 2) or ((ACol = 1) and (ARow = 1)) then
             Canvas.Brush.Color:=ClGreen;
          canvas.FillRect(Rect);
          end;
      with Leftgrid do
          begin
          if (ACol = 2) or ((ACol = 1) and (ARow = 1))  then
             Canvas.Brush.Color:=rgb(254,156,24);
          canvas.FillRect(Rect);
          end;
       with FrontGrid do
          begin
          if (ARow = 0) or  ((ACol = 1) and (ARow = 1))  then
               Canvas.Brush.Color:=ClBlue;
          canvas.FillRect(Rect);
          end;
      end;

      3:
      Begin
      with Downgrid do
          begin
               Canvas.Brush.Color:=ClWhite;
               canvas.FillRect(Rect);
          End;
      for I := 2 to 5 do
        begin
         case i of
              2: Grid:= FrontGrid;
              3: Grid:= BackGrid;
              4: Grid:= RightGrid;
              5: Grid:= LeftGrid;
         end;
          with Grid do
          begin
               Canvas.Brush.Color:=rgb(225,225,225);
               canvas.FillRect(Rect);
          end;
        end;
      with upGrid do
         begin
         if ((ACol = 1) and (ARow = 1)) then
            Canvas.Brush.Color:=clYellow
         else
             Canvas.Brush.Color:=rgb(225,225,225);
         canvas.FillRect(Rect);
         end;
      with RightGrid do
          begin
          if ((ACol = 0) or (ACol = 1)) then
              Canvas.Brush.Color:=ClRed;
          canvas.FillRect(Rect);
          end;
      with Backgrid do
          begin
          if ((ARow = 2) or (ARow =1)) then
               Canvas.Brush.Color:=ClGreen;
          canvas.FillRect(Rect);
          end;
      with Leftgrid do
          begin
          if ((ACol = 2) or (ACol = 1)) then
               Canvas.Brush.Color:=rgb(254,156,24);
          canvas.FillRect(Rect);
          end;
      with FrontGrid do
          begin
          if ((ARow = 0) or (ARow =1)) then
               Canvas.Brush.Color:=ClBlue;
          canvas.FillRect(Rect);
          end;
      End;

      4:
      Begin
      with Downgrid do
          begin
               Canvas.Brush.Color:=ClWhite;
               canvas.FillRect(Rect);
          End;
      for I := 2 to 5 do
        begin
         case i of
              
              2: Grid:= FrontGrid;
              3: Grid:= BackGrid;
              4: Grid:= RightGrid;
              5: Grid:= LeftGrid;
         end;
          with Grid do
          begin
               Canvas.Brush.Color:=rgb(225,225,225);
               canvas.FillRect(Rect);
          end;
        end;
      With UpGrid do
         begin
         if ((ACol = 1) or (ARow = 1)) or ((ACol = 2) and (ARow = 2)) or  ((ACol = 0) and (ARow = 0)) then
                 Canvas.Brush.Color:=clYellow
         else if ((ACol = 2) and (ARow =0) or ((ACol = 0) and (ARow = 2))) then
                 Canvas.Brush.Color:=ClBlue
         else
                 Canvas.Brush.Color:=rgb(225,225,225);
         canvas.FillRect(Rect);
         end;
      with RightGrid do
          begin
          if ((ACol = 0) or (ACol = 1) or (ARow = 1)) then
              Canvas.Brush.Color:=ClRed;
          if ((ACol = 2) and (ARow = 0)) then
              Canvas.Brush.Color:=ClGreen;
          if ((ACol = 2) and (ARow = 2)) then
              Canvas.Brush.Color:=ClYellow;
          canvas.FillRect(Rect);
          end;
      with Backgrid do
          begin
          if ((ARow = 2) or (ARow =1) or (ACol = 1)) then
               Canvas.Brush.Color:=ClGreen;
          if ((ACol = 2) and (ARow = 0)) then
              Canvas.Brush.Color:=ClRed;
          if ((ACol = 0) and (ARow = 0)) then
              Canvas.Brush.Color:=ClYellow;
          canvas.FillRect(Rect);
          end;
      with Leftgrid do
          begin
          if ((ACol = 2) or (ACol = 1) or (ARow = 1) or (ARow = 0)) then
               Canvas.Brush.Color:=rgb(254,156,24);
          if ((ACol = 0) and (ARow = 2)) then
              Canvas.Brush.Color:=ClRed;
          canvas.FillRect(Rect);
          end;
      with FrontGrid do
          begin
          if ((ARow = 0) or (ARow =1) or (ACol = 1)) then
               Canvas.Brush.Color:=ClBlue;
          if ((ACol = 0) and (ARow = 2)) then
              Canvas.Brush.Color:=ClGreen;
          if ((ACol = 2) and (ARow = 2)) then
              Canvas.Brush.Color:=ClRed;
          canvas.FillRect(Rect);
          end;
      End;

      5:
      begin
       with Downgrid do
          begin
               Canvas.Brush.Color:=ClWhite;
               canvas.FillRect(Rect);
          End;
       with RightGrid do
          begin
          if ((ACol = 0) or (ACol = 1) or (ARow = 1)) then
               Canvas.Brush.Color:=ClRed;
          if ((ACol = 2) and (ARow = 0)) then
               Canvas.Brush.Color:=clYellow;
          if ((ACol = 2) and (ARow = 2)) then
               Canvas.Brush.Color:=clBlue;
               canvas.FillRect(Rect);
          end;
        with Backgrid do
          begin
          if ((ARow = 2) or (ARow =1) or (ACol = 1)) then
               Canvas.Brush.Color:=ClGreen;
          if ((ACol = 2) and (ARow = 0)) then
               Canvas.Brush.Color:=ClRed;
          if ((ACol = 0) and (ARow = 0)) then
               Canvas.Brush.Color:=clYellow;
          canvas.FillRect(Rect);
          end;
        with Leftgrid do
          begin
          if ((ACol = 2) or (ACol = 1) or (ARow = 1)) then
               Canvas.Brush.Color:=rgb(254,156,24);
          if ((ACol = 0) and (ARow = 0)) then
               Canvas.Brush.Color:=ClGreen;
          if ((ACol = 0) and (ARow = 2)) then
               Canvas.Brush.Color:=clYellow;
               canvas.FillRect(Rect);
          end;
        with FrontGrid do
          begin
          if ((ARow = 0) or (ARow =1) or (ACol = 1)) then
               Canvas.Brush.Color:=ClBlue;
          if ((ACol = 0) and (ARow = 2)) then
               Canvas.Brush.Color:=rgb(254,156,24);
          if ((ACol = 2) and (ARow = 2)) then
               Canvas.Brush.Color:=clYellow;
          canvas.FillRect(Rect);
          end;
        with UpGrid do
          begin
          if ((ACol = 0) and (ARow = 2)) then
               Canvas.Brush.Color:=rgb(254,156,24)
          else if ((ACol = 0) and (ARow = 0)) then
               Canvas.Brush.Color:=clBlue
          else if ((ACol = 2) and (ARow = 0)) then
               Canvas.Brush.Color:=clRed
          else if ((ACol = 2) and (ARow = 2)) then
               Canvas.Brush.Color:=clGreen
          else
              Canvas.Brush.Color:=clYellow;
          canvas.FillRect(Rect);
          end;
      end;
  end;
end;
end.
