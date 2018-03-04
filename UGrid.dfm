object Gridform: TGridform
  Left = 0
  Top = 0
  Cursor = crArrow
  Caption = 'Gridform'
  ClientHeight = 691
  ClientWidth = 834
  Color = clGradientActiveCaption
  Constraints.MaxHeight = 750
  Constraints.MaxWidth = 850
  Constraints.MinHeight = 750
  Constraints.MinWidth = 850
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RubiksLbl: TLabel
    Left = 189
    Top = 184
    Width = 466
    Height = 58
    Caption = 'Rubiks Cube Solver'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ChooseLbl: TLabel
    Left = 48
    Top = 255
    Width = 770
    Height = 33
    Caption = 'Do you want to solve a cube or learn the method to solve cubes?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object MovesExplained: TLabel
    Left = 367
    Top = 10
    Width = 200
    Height = 25
    Caption = 'Step 1:'
    Constraints.MaxWidth = 200
    Constraints.MinWidth = 200
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  object Algorithms: TLabel
    Left = 502
    Top = 404
    Width = 250
    Height = 69
    Caption = 'R" U F" U"'
    Constraints.MaxWidth = 250
    Constraints.MinWidth = 250
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  object AlgorithmExplained: TLabel
    Left = 346
    Top = 41
    Width = 385
    Height = 324
    Caption = 
      'Make a white cross on the top of your cube. Try and position the' +
      ' white middle pieces so that they match the middle of the face b' +
      'elow. If your cube looks like this, with a white middle piece in' +
      ' the right place but the wrong orientation then, follow the algo' +
      'rithm below:'
    Constraints.MaxWidth = 385
    Constraints.MinWidth = 385
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  object UpGrid: TStringGrid
    Left = 179
    Top = 41
    Width = 161
    Height = 161
    ColCount = 3
    DefaultColWidth = 50
    DefaultRowHeight = 50
    FixedCols = 0
    RowCount = 3
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Visible = False
    OnDrawCell = UpGridDrawCell
    ColWidths = (
      50
      50
      50)
    RowHeights = (
      50
      50
      50)
  end
  object FillBtn: TButton
    Left = 737
    Top = 448
    Width = 81
    Height = 25
    Caption = 'Fill Grid'
    TabOrder = 1
    Visible = False
    OnClick = FillBtnClick
  end
  object ChoiceRG: TRadioGroup
    Left = 717
    Top = 242
    Width = 101
    Height = 185
    Caption = 'Fill style'
    ItemIndex = 0
    Items.Strings = (
      'Reset'
      'Random'
      'White'
      'Red'
      'Orange'
      'Yellow'
      'Green'
      'Blue')
    TabOrder = 2
    Visible = False
  end
  object FrontGrid: TStringGrid
    Left = 179
    Top = 520
    Width = 161
    Height = 161
    ColCount = 3
    DefaultColWidth = 50
    DefaultRowHeight = 50
    FixedCols = 0
    RowCount = 3
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnDrawCell = UpGridDrawCell
    ColWidths = (
      50
      50
      50)
    RowHeights = (
      50
      50
      50)
  end
  object DownGrid: TStringGrid
    Left = 179
    Top = 361
    Width = 161
    Height = 161
    ColCount = 3
    DefaultColWidth = 50
    DefaultRowHeight = 50
    FixedCols = 0
    RowCount = 3
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
    OnDrawCell = UpGridDrawCell
    ColWidths = (
      50
      50
      50)
    RowHeights = (
      50
      50
      50)
  end
  object BackGrid: TStringGrid
    Left = 179
    Top = 201
    Width = 161
    Height = 161
    ColCount = 3
    DefaultColWidth = 50
    DefaultRowHeight = 50
    FixedCols = 0
    RowCount = 3
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Visible = False
    OnDrawCell = UpGridDrawCell
    ColWidths = (
      50
      50
      50)
    RowHeights = (
      50
      50
      50)
  end
  object RightGrid: TStringGrid
    Left = 339
    Top = 361
    Width = 161
    Height = 161
    ColCount = 3
    DefaultColWidth = 50
    DefaultRowHeight = 50
    FixedCols = 0
    RowCount = 3
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
    OnDrawCell = UpGridDrawCell
    ColWidths = (
      50
      50
      50)
    RowHeights = (
      50
      50
      50)
  end
  object LeftGrid: TStringGrid
    Left = 19
    Top = 361
    Width = 161
    Height = 161
    ColCount = 3
    DefaultColWidth = 50
    DefaultRowHeight = 50
    FixedCols = 0
    RowCount = 3
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Visible = False
    OnDrawCell = UpGridDrawCell
    ColWidths = (
      50
      50
      50)
    RowHeights = (
      50
      50
      50)
  end
  object ExitBtn: TButton
    Left = 737
    Top = 572
    Width = 81
    Height = 25
    Caption = 'Exit'
    TabOrder = 8
    Visible = False
    OnClick = ExitBtnClick
  end
  object Solve: TButton
    Left = 737
    Top = 479
    Width = 81
    Height = 25
    Caption = 'Solve'
    TabOrder = 9
    Visible = False
  end
  object Next: TButton
    Left = 737
    Top = 510
    Width = 81
    Height = 25
    Caption = 'Next Step'
    TabOrder = 10
    Visible = False
    OnClick = NextClick
  end
  object Previous: TButton
    Left = 737
    Top = 541
    Width = 81
    Height = 25
    Caption = 'Previous Step'
    TabOrder = 11
    Visible = False
    OnClick = PreviousClick
  end
  object Solve2: TButton
    Left = 320
    Top = 307
    Width = 81
    Height = 25
    Caption = 'Solve'
    TabOrder = 12
    OnClick = Solve2Click
  end
  object Tutorial: TButton
    Left = 423
    Top = 307
    Width = 81
    Height = 25
    Caption = 'Tutorial'
    TabOrder = 13
    OnClick = TutorialClick
  end
  object Steps: TRadioGroup
    Left = 744
    Top = 1
    Width = 58
    Height = 201
    Caption = 'Steps'
    ItemIndex = 0
    Items.Strings = (
      'Step 1'
      'Step 2'
      'Step 3'
      'Step 4'
      'Step 5'
      'Step 6')
    TabOrder = 19
    Visible = False
  end
  object Moves: TMemo
    Left = -1
    Top = -2
    Width = 174
    Height = 197
    Enabled = False
    Lines.Strings = (
      'Moves:'
      'U = Top Face Clockwise'
      'U" = Top Face Anticlockwise'
      'D = Down Face Clockwise'
      'D" = Down Face Anticlockwise'
      'F = Front Face Clockwise'
      'F" = Front Face Anticlockwise'
      'B = Back Face Clockwise'
      'B" = Back Face Anticlockwise'
      'L = Left Face Clockwise'
      'L" = Left Face Anticlockwise'
      'R = Right Face Clockwise'
      'R" = Right Face Anticlockwise'
      'D2 = Turn Bottom Face Twice etc')
    MaxLength = 371
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 20
    Visible = False
  end
  object Step6: TButton
    Left = 768
    Top = 170
    Width = 56
    Height = 25
    Caption = 'Step 6'
    TabOrder = 21
    Visible = False
    OnClick = Step6Click
  end
  object Step1: TButton
    Left = 768
    Top = 15
    Width = 58
    Height = 25
    Caption = 'Step 1'
    TabOrder = 14
    Visible = False
    OnClick = Step1Click
  end
  object Step2: TButton
    Left = 768
    Top = 46
    Width = 56
    Height = 25
    Caption = 'Step 2'
    TabOrder = 15
    Visible = False
    OnClick = Step2Click
  end
  object Step3: TButton
    Left = 768
    Top = 77
    Width = 56
    Height = 25
    Caption = 'Step 3'
    TabOrder = 17
    Visible = False
    OnClick = Step3Click
  end
  object Step4: TButton
    Left = 768
    Top = 108
    Width = 56
    Height = 25
    Caption = 'Step 4'
    TabOrder = 16
    Visible = False
    OnClick = Step4Click
  end
  object Step5: TButton
    Left = 768
    Top = 139
    Width = 56
    Height = 25
    Caption = 'Step 5'
    TabOrder = 18
    Visible = False
    OnClick = Step5Click
  end
  object StringColours: TEdit
    Left = 346
    Top = 139
    Width = 482
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 22
    Text = 
      'Please enter the first letter of the colour of each cell for the' +
      ' top face  '
    Visible = False
  end
  object MainMenu: TMainMenu
    object Menu1: TMenuItem
      Caption = 'Menu'
      object TutorialMenu: TMenuItem
        Caption = 'Tutorial'
        OnClick = TutorialMenuClick
      end
      object SolveMenu: TMenuItem
        Caption = 'Solve My Cube'
        OnClick = SolveMenuClick
      end
      object ExitMenu: TMenuItem
        Caption = 'Exit'
        OnClick = ExitMenuClick
      end
    end
  end
end
